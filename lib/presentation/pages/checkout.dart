import 'package:car_servicing/presentation/pages/payment.dart';
import 'package:car_servicing/presentation/widgets/date_time_custom.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isDateTimeSelected = false;

  void _onDateSelected(DateTime dateTime) {
    final now = DateTime.now();
    final bool isValidTime = dateTime.isAfter(now) &&
        (dateTime.hour > 8 || (dateTime.hour == 8 && dateTime.minute >= 0)) &&
        (dateTime.hour < 17 ||
            (dateTime.hour == 17 &&
                dateTime.minute == 0)); // Ensure time between 08:00 and 17:00

    setState(() {
      isDateTimeSelected = isValidTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Pick-up Address',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
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
              onPressed: isDateTimeSelected
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(),
                        ),
                      );
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text('Proceed to the next screen...'),
                      //   ),
                      // );
                    }
                  : null,
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
