
// import 'package:car_servicing/ui/screens/BasicService.dart';
import 'package:car_servicing/ui/screens/Checkout.dart';
import 'package:car_servicing/ui/screens/EditUserProfile.dart';
import 'package:car_servicing/ui/screens/Login.dart';
import 'package:car_servicing/ui/screens/Registation.dart';
import 'package:car_servicing/ui/screens/Settings.dart';
import 'package:car_servicing/ui/screens/UserProfile.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Car Servicing Booking',
    //   theme: ThemeData(
    //     primarySwatch: Colors.teal,
    //   ),
    //   home: CheckoutScreen(),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.id,
      routes: {
        UserProfile.id: (context) => const UserProfile(),
        EditUserProfile.id: (context) => const EditUserProfile(),
        Settings.id:(context) => const Settings(),
        Login.id:(context)=> const Login(),
        Registation.id: (context) => const Registation(),
      },
    );
  }
}
