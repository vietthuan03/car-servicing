import 'package:car_servicing/presentation/pages/infor_car/vehicle.dart';
import 'package:car_servicing/presentation/pages/payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/appoinment_model.dart';
import '../../repository/appointment_repo.dart';
import '../widgets/date_time_custom.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  static const String id = 'checkout';

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isDateTimeSelected = false;
  DateTime? selectedDateTime;
  final AppointmentRepository _appointmentRepository = AppointmentRepository();

  void _onDateSelected(DateTime dateTime) {
    final now = DateTime.now();
    final bool isValidTime = dateTime.isAfter(now) &&
        (dateTime.hour > 8 || (dateTime.hour == 8 && dateTime.minute >= 0)) &&
        (dateTime.hour < 17 ||
            (dateTime.hour == 17 &&
                dateTime.minute == 0)); // Ensure time between 08:00 and 17:00

    setState(() {
      isDateTimeSelected = isValidTime;
      if (isValidTime) {
        selectedDateTime = dateTime;
      }
    });
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> _proceedToPayment() async {
    if (selectedDateTime != null) {
      final appointment = AppointmentModel(
        appointmentDate: selectedDateTime,
        userId: userId, id: '',
        // carId: 'your_car_id', // Replace with actual car ID
        // serviceId: 'your_service_id', // Replace with actual service ID
      );
      await _appointmentRepository.bookAppointment(appointment, userId);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PaymentPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          // Back button
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, VehicleScreen.id);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'When do you want the service?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Date & Time',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: DateTimePickerCustom(
                      onDateSelected: _onDateSelected,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const Text(
              'Basic Service 2.599.000 VND',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isDateTimeSelected ? _proceedToPayment : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: const Text('PROCEED'),
            ),
          ],
        ),
      ),
    );
  }
}
