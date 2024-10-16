
import 'package:car_servicing/ui/screens/BasicService.dart';
import 'package:car_servicing/ui/screens/Checkout.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Servicing Booking',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: CheckoutScreen(),
    );
  }
}
