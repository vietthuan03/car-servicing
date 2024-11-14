import 'package:car_servicing/firebase_option.dart';
import 'package:car_servicing/presentation/pages/user/EditUserProfile.dart';
import 'package:car_servicing/presentation/pages/auth/Login.dart';
import 'package:car_servicing/presentation/pages/auth/Registation.dart';
import 'package:car_servicing/presentation/pages/settings.dart';
import 'package:car_servicing/presentation/pages/user/UserProfile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //firebase authentication
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        Settings.id: (context) => const Settings(),
        Login.id: (context) => const Login(),
        Registation.id: (context) => const Registation(),
      },
    );
  }
}
