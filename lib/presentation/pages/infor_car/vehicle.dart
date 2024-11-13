import 'package:car_servicing/repository/service_repo.dart';
import 'package:car_servicing/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/service_model.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/service_cart_provider.dart';
import '../../widgets/service_order.dart';

class VehicleScreen extends StatelessWidget {
  final ServiceRepository serviceRepository = ServiceRepository();
  final ServiceModel service;

  VehicleScreen({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FA),
      appBar: AppBar(
        title: const Text('Hello Thuan'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/user.jpg'),
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
            ServiceCard2(
              service: service,
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
              height: 32,
            ),
            // ServiceCard(),
          ],
        ),
      ),
    );
  }
}
