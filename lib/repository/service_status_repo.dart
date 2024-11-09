import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceStatusRepository {
  final CollectionReference _serviceStatus =
      FirebaseFirestore.instance.collection('serviceStatus');

  // Cập nhật trạng thái dịch vụ
  Future<void> updateServiceStatus(String appointmentId, String status) async {
    await _serviceStatus.doc(appointmentId).set({
      'status': status,
      'statusUpdateDate': DateTime.now(),
    });
  }

  // Gửi thông báo đến người dùng
  Future<void> sendStatusNotification(String userId, String message) async {
    // Logic gửi thông báo, có thể sử dụng Firebase Cloud Messaging (FCM)
  }
}
