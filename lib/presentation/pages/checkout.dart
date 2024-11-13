import 'package:car_servicing/presentation/widgets/date_picker_custom.dart';
import 'package:car_servicing/presentation/widgets/time_picker_custom.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedDateIndex = 0;
  int selectedTimeSlotIndex = -1;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void onTimeSelected(TimeOfDay time) {
    setState(() {
      selectedTime = time;
    });
  }

  bool get isProceedEnabled {
    return selectedDate != null &&
        selectedTime != null &&
        selectedTime!.hour >= 8 &&
        selectedTime!.hour <= 17;
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
                    'Select Date',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: DatePickerCustom(
                      onDateSelected: onDateSelected,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Select Pick-up Time Slot',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: TimePickerCustom(
                      onTimeSelected: onTimeSelected,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Basic Service 2.599.000 VND',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isProceedEnabled
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Proceeding a booking...')),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => SelectServiceScreen(),
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
