
import 'package:car_servicing/presentation/pages/checkout.dart';
import 'package:car_servicing/presentation/pages/home.dart';
import 'package:car_servicing/presentation/pages/select_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCK1ycvjMVqlkBoOCio0td0l3QGBs8j3-E", // paste your api key here
      appId: "1:173987522263:android:68c5afef34ef409f07f292", //paste your app id here
      messagingSenderId: "173987522263", //paste your messagingSenderId here
      projectId: "car-service-f3b5b", //paste your project id here
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Servicing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
