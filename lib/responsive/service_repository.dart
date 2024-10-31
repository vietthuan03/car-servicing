// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/service_model.dart';
import '../services/firebase_service.dart';

class ServiceRepository {
  final FirebaseService firebaseService;

  ServiceRepository({required this.firebaseService});

  // Fetch all services from Firebase
  Future<List<ServiceModel>> getServices() async {
    final snapshot =
        await firebaseService.firestore.collection('services').get();
    return snapshot.docs
        .map((doc) => ServiceModel.fromFirestore(doc.data(), doc.id))
        .toList();
  }

  // Add a new service to Firebase
  Future<void> addService(ServiceModel service) async {
    final docRef =
        firebaseService.firestore.collection('services').doc(service.id);
    await docRef.set(service.toFirestore());
  }

  // Update an existing service
  Future<void> updateService(ServiceModel service) async {
    final docRef =
        firebaseService.firestore.collection('services').doc(service.id);
    await docRef.update(service.toFirestore());
  }

  // Delete a service
  Future<void> deleteService(String id) async {
    final docRef = firebaseService.firestore.collection('services').doc(id);
    await docRef.delete();
  }
}
