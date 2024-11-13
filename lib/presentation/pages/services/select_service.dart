import 'package:car_servicing/presentation/pages/infor_car/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../../../models/service_model.dart';
import '../../../repository/service_repo.dart';
import '../../widgets/service_cart_provider.dart';
import '../home.dart';
import '../../widgets/service_card.dart';

class SelectServicePage extends StatefulWidget {
  @override
  _SelectServicePageState createState() => _SelectServicePageState();
}

class _SelectServicePageState extends State<SelectServicePage> {
  final ServiceRepository _serviceRepository = ServiceRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Service'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Column(
        children: [
          // Expanded ListView to display services
          Expanded(
            child: StreamBuilder<List<ServiceModel>>(
              stream: _serviceRepository.getServicesStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong!'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No services available'));
                }

                // Convert Firestore data to a list of ServiceModel
                List<ServiceModel> services = snapshot.data!;

                return ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return Consumer<ServiceCartProvider>(
                      builder: (context, cartProvider, child) {
                        return ServiceCard(
                          service: services[index],
                          cartProvider: cartProvider,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Consumer<ServiceCartProvider>(
            builder: (context, cartProvider, child) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.orangeAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${cartProvider.serviceCount} Services',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home(
                                  // service: null,
                                  )),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Go To Cart'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
