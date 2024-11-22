import 'package:car_servicing/firebase_option.dart';
import 'package:car_servicing/presentation/pages/Home.dart';
import 'package:car_servicing/presentation/pages/checkout.dart';
import 'package:car_servicing/presentation/pages/infor_car/add_car_screen.dart';
import 'package:car_servicing/presentation/pages/services/select_service.dart';
import 'package:car_servicing/presentation/pages/user/EditUserProfile.dart';
import 'package:car_servicing/presentation/pages/auth/Login.dart';
import 'package:car_servicing/presentation/pages/auth/Registation.dart';
import 'package:car_servicing/presentation/pages/settings.dart';
import 'package:car_servicing/presentation/pages/user/UserProfile.dart';
import 'package:car_servicing/presentation/widgets/service_card.dart';
import 'package:car_servicing/presentation/widgets/service_order.dart';
import 'package:car_servicing/provider/service_cart_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    //   home: AddCarScreen(),
    // );

    return ChangeNotifierProvider(
        create: (context) => ServiceCartProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Login.id,
          routes: {
            Home.id: (context) => const Home(),
            ServiceOrder.id: (context) => const ServiceOrder(),
            // SelectServicePage.id (context) => const SelectServicePage(),
            UserProfile.id: (context) => const UserProfile(),
            EditUserProfile.id: (context) => const EditUserProfile(),
            Settings.id: (context) => const Settings(),
            Login.id: (context) => const Login(),
            Registation.id: (context) => const Registation(),
          },
        ));
  }
}
