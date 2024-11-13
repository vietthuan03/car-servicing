import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/service_model.dart';

class ServiceRepository {
  final CollectionReference servicesCollection =
      FirebaseFirestore.instance.collection('services');

  // Lấy danh sách dịch vụ từ Firestore
  Stream<List<ServiceModel>> getServicesStream() {
    return servicesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ServiceModel.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
