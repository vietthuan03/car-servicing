import 'package:flutter/material.dart';

class TimePickerCustom extends StatefulWidget {
  final Function(TimeOfDay) onTimeSelected;

  TimePickerCustom({required this.onTimeSelected});

  @override
  _TimePickerCustomState createState() => _TimePickerCustomState();
}

class _TimePickerCustomState extends State<TimePickerCustom> {
  TimeOfDay selectedTime = TimeOfDay.now();

  selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      if (picked.hour >= 8 && picked.hour <= 17) {
        setState(() {
          selectedTime = picked;
        });
        widget.onTimeSelected(picked);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a time between 8 AM and 5 PM')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(selectedTime.format(context), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        const SizedBox(height: 16.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () => selectTime(context),
          child: const Text('Select time', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}