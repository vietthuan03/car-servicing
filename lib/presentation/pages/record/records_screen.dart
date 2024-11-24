import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/appoinment_model.dart';
import '../../../services/Auth_service.dart';
import '../../../viewmodels/appointment_vm.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../infor_car/add_car_screen.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    final authService = AuthService();
    final uid = authService.getCurrentUserId();
    if (uid != null) {
      final name = await authService.getUserName(uid);
      setState(() {
        userName = name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap Column in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildUserGreeting(context, userName),
              const SizedBox(height: 16),
              _buildServiceRecord(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}

Widget _buildUserGreeting(BuildContext context, dynamic userName) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddCarScreen()),
      );
    },
    child: Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/car.jpg'),
          radius: 25,
        ),
        const SizedBox(width: 10),
        Text('Hello ${userName ?? 'User'}', style: const TextStyle(fontSize: 20)),
      ],
    ),
  );
}

Widget _buildServiceRecord(BuildContext context) {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  return StreamBuilder<List<AppointmentModel>>(
    stream:
        Provider.of<AppointmentViewModel>(context).getUserAppointments(userId),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return const Text('No appointments found');
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final appointment = snapshot.data![index];
            return Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appointment.serviceId != null &&
                                    appointment.serviceId!.isNotEmpty
                                ? appointment.serviceId!
                                : "Service ID",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              appointment.status.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Booking ID: ${appointment.id}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        appointment.carId != null &&
                                appointment.carId!.isNotEmpty
                            ? appointment.carId!
                            : "Car ID",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "DATE",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        appointment.appointmentDate != null
                            ? "${appointment.appointmentDate!.hour}:${appointment.appointmentDate!.minute}  ${appointment.appointmentDate!.day}, ${appointment.appointmentDate!.month}, ${appointment.appointmentDate!.year}"
                            : "Date",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton(
                        onPressed: () {
                          // Action for "Book Again"
                        },
                        child: const Text("BOOK AGAIN"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    },
  );
}
