import 'package:car_servicing/repository/service_repo.dart';
import 'package:car_servicing/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/service_model.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../../provider/service_cart_provider.dart';
import '../../widgets/service_order.dart';
import '../checkout.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  static const String id = 'vehicle_screeen';

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final ServiceRepository _serviceRepository = ServiceRepository();
  late ServiceModel service;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ServiceCartProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FA),
      appBar: AppBar(
        title: const Text('Hello Thuan'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/car.png'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final service = cartProvider.cartItems.keys.elementAt(index);
                  final count = cartProvider.cartItems[service]!;
                  return ListTile(
                    leading: Image.network(service.imageUrl,
                        width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(service.title),
                    subtitle: Text(
                        '${service.price} VND x $count = {${service.price} * $count}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cartProvider.removeService(service);
                      },
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                // Điều hướng đến trang Checkout
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CheckoutScreen()),
                );
              },
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
