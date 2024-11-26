import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/appoinment_model.dart';
import '../../../models/service_model.dart';
import '../../../services/Auth_service.dart';
import '../../../viewmodels/appointment_vm.dart';
import '../../widgets/bottom_nav_bar.dart';

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
      appBar: AppBar(
        title: const Text('Record'),
        backgroundColor: Colors.blue,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/car.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Wrap Column in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // _buildUserGreeting(context, userName),
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
            if (appointment.serviceId == null || appointment.serviceId!.isEmpty) {
              return const Text('Service ID is missing');
            }
            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('services')
                  .doc(appointment.serviceId)
                  .get(),
              builder: (context, serviceSnapshot) {
                if (serviceSnapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (serviceSnapshot.hasError) {
                  return Text('Error: ${serviceSnapshot.error}');
                } else if (!serviceSnapshot.hasData || !serviceSnapshot.data!.exists) {
                  return const Text('Service not found');
                } else {
                  final service = ServiceModel.fromFirestore(
                      serviceSnapshot.data!.data() as Map<String, dynamic>,
                      serviceSnapshot.data!.id);
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
                                  service.title,
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
                                  : "Car ID: 34PnpibXKtmCKi9xziHd",
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
                }
              },
            );
          },
        );
      }
    },
  );
}
