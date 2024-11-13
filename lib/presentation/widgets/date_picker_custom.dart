import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerCustom extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  DatePickerCustom({required this.onDateSelected});

  @override
  _DatePickerCustomState createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  /// Which holds the selected date
  /// Defaults to today's date.
  DateTime selectedDate = DateTime.now();
  // This decides which day will be enabled
  // This will be called every time while displaying day in calender.
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 90))))) {
      return true;
    }
    return false;
  }
  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      selectableDayPredicate: _decideWhichDayToEnable,
      builder: (context, child) => Theme(data: ThemeData.light(),child: child ?? const SizedBox.shrink(),),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${selectedDate.toLocal()}".split(' ')[0], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.blue,
              ),
              onPressed: () => selectDate(context),
              child: const Text('Select date',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
  
}
