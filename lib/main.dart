import 'package:car_servicing/presentation/pages/checkout.dart';
import 'package:car_servicing/presentation/pages/home.dart';
import 'package:car_servicing/presentation/pages/services/select_service.dart';
import 'package:car_servicing/presentation/widgets/service_cart_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/service_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCK1ycvjMVqlkBoOCio0td0l3QGBs8j3-E",
      appId: "1:173987522263:android:68c5afef34ef409f07f292",
      messagingSenderId: "173987522263",
      projectId: "car-service-f3b5b",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ServiceCartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  late final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Car Servicing App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false, // Tắt debug banner
        home: Home());
  }
}
