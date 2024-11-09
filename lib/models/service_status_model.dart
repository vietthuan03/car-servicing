import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceStatusModel {
  final String? id;
  final String appointmentId;
  final String status; // "in_progress", "completed", "canceled"
  final DateTime statusUpdateDate;

  ServiceStatusModel({
    this.id,
    required this.appointmentId,
    required this.status,
    required this.statusUpdateDate,
  });

  // Tạo ServiceStatusModel từ dữ liệu Firebase
  factory ServiceStatusModel.fromFirestore(
      Map<String, dynamic> data, String docId) {
    return ServiceStatusModel(
      id: docId,
      appointmentId: data['appointmentId'] ?? '',
      status: data['status'] ?? 'in_progress',
      statusUpdateDate: (data['statusUpdateDate'] as Timestamp).toDate(),
    );
  }

  // Chuyển ServiceStatusModel thành JSON để lưu vào Firebase
  Map<String, dynamic> toFirestore() {
    return {
      'appointmentId': appointmentId,
      'status': status,
      'statusUpdateDate': statusUpdateDate,
    };
  }
}
