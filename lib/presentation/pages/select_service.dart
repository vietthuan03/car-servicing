import 'package:flutter/material.dart';

import '../widgets/service_card.dart';
import 'home.dart';

class SelectServicePage extends StatelessWidget {
  const SelectServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarServicePage(),
    );
  }
}

class CarServicePage extends StatelessWidget {
  final List<Service> services = [
    Service(
      title: 'Basic Service',
      description: 'Every 5000 Kms/3 Months\nTakes 4 Hours\n1 Month Warranty\nIncludes 9 Services',
      price: '2.599.000 VND',
      imageUrl: 'assets/images/basic_car.png', // Ensure asset paths are correct
    ),
    Service(
      title: 'Standard Service',
      description: 'Every 10000 Kms/6 Months\nTakes 6 Hours\n1 Month Warranty\nIncludes 15 Services',
      price: '3.799.000 VND',
      imageUrl: 'assets/images/standard_car.png',
    ),
    Service(
      title: 'Comprehensive Service',
      description: 'Every 20000 Kms/1 Year\nTakes 8 Hours\n1 Month Warranty\nIncludes 20 Services',
      price: '5.699.000 VND',
      imageUrl: 'assets/images/comprehensive_car.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Service'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return ServiceCard(service: services[index]);
        },
      ),
    );
  }
}