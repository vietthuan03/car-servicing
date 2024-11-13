import 'package:flutter/material.dart';

import '../widgets/Button_up_past.dart';
import '../widgets/body_call_cancel.dart';
// Import widget từ callcancell.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //  "DEBUG" hidden
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isPastSelected = false;
  List<bool> isSelected = [true, false]; // Trạng thái ban đầu (UPCOMING được chọn)

  void toggleUpcoming() {
    setState(() {
      isSelected = [true, false];
      isPastSelected = false;
    });
  }

  void togglePast() {
    setState(() {
      isSelected = [false, true];
      isPastSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello +....'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/user.jpg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ButtonToggle(
              isUpcomingSelected: isSelected[0],
              isPastSelected: isSelected[1],
              onUpcomingTap: toggleUpcoming,
              onPastTap: togglePast,
            ),
            if (!isPastSelected) // upcomingBookingCard sẽ hiển thị khi isPastSelected là false (tức là khi nhấn vào UPCOMING), và _emptyPastMessage sẽ hiển thị khi isPastSelected là true (tức là khi nhấn vào PAST).
              Column(
                children: [
                  UpcomingBookingCard(), // Khối đầu tiên
                  UpcomingBookingCard2(), // Khối thứ hai
                ],
              )
            else
              _emptyPastMessage(),
          ],
        ),
      ),
    );
  }


  Widget _emptyPastMessage() {
    return Center(
      child: Text(
        'No past bookings',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
