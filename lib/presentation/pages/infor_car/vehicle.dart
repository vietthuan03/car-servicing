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
  final ServiceRepository _serviceRepository = ServiceRepository();
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
      body: StreamBuilder<ServiceModel>(
        stream: _serviceRepository.getServiceById(service.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Service not found'));
          }

          final updatedService = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ServiceOrder(service: updatedService),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 32,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
