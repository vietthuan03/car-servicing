import 'package:flutter/material.dart';
import '../../models/service_model.dart';
import '../../repository/service_repo.dart';
import 'service_cart_provider.dart';
import '../pages/services/basic_service.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final ServiceCartProvider cartProvider;
  final ServiceRepository _serviceRepository = ServiceRepository();

  ServiceCard({
    super.key,
    required this.service,
    required this.cartProvider,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ServiceModel>(
      stream: _serviceRepository.getServiceById(service.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading service data'));
        }
        if (!snapshot.hasData) {
          return const Center(child: Text('Service not available'));
        }

        // Dữ liệu dịch vụ đã được cập nhật từ Firestore
        final updatedService = snapshot.data!;

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BasicServicePage(),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.all(12),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    updatedService.imageUrl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          updatedService.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          updatedService.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          updatedService.price,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cartProvider.addService();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${updatedService.title} added to cart'),
                          duration: const Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.black87,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                    child: const Text('ADD'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
