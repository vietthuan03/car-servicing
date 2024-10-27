import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Service {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  Service({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              service.imageUrl, // Load local asset images
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(service.description),
                  SizedBox(height: 8),
                  Text(
                    service.price,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle ADD button press
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${service.title} added to cart')),
                );
              },
              child: Text('ADD'),
            ),
          ],
        ),
      ),
    );
  }
}