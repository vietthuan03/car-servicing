
import 'package:car_servicing/presentation/pages/user/EditUserProfile.dart';
import 'package:car_servicing/presentation/pages/auth/Login.dart';
import 'package:car_servicing/presentation/pages/auth/Registation.dart';
import 'package:car_servicing/presentation/pages/Settings.dart';
import 'package:car_servicing/presentation/pages/user/UserProfile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  //firebase authentication
  WidgetsFlutterBinding.ensureInitialized();
  
  if(kIsWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyDD_CGCO1Nip3tg5g6l1kLXnfhpby8PVbs",
  authDomain: "car-service-f3b5b.firebaseapp.com",
  databaseURL: "https://car-service-f3b5b-default-rtdb.firebaseio.com",
  projectId: "car-service-f3b5b",
  storageBucket: "car-service-f3b5b.firebasestorage.app",
  messagingSenderId: "173987522263",
  appId: "1:173987522263:web:1976716ffaa63eb907f292",
  measurementId: "G-FVGTW17R7N"));
  }
  else{
    await Firebase.initializeApp();
  }
  
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
      initialRoute: Registation.id,
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
