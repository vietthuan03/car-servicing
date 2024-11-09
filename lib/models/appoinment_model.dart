import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  final String? id;
  final String serviceId;
  final String userId;
  final String carId; // Tham chiếu đến ID của xe
  final DateTime appointmentDate;
  final String status; // e.g., "scheduled", "completed", "canceled"

  AppointmentModel({
    this.id,
    required this.serviceId,
    required this.userId,
    required this.carId,
    required this.appointmentDate,
    this.status = "scheduled",
  });

  // Tạo AppointmentModel từ dữ liệu Firebase
  factory AppointmentModel.fromFirestore(
      Map<String, dynamic> data, String docId) {
    return AppointmentModel(
      id: docId,
      serviceId: data['serviceId'] ?? '',
      userId: data['userId'] ?? '',
      carId: data['carId'] ?? '',
      appointmentDate: (data['appointmentDate'] as Timestamp).toDate(),
      status: data['status'] ?? 'scheduled',
    );
  }

  // Chuyển AppointmentModel thành JSON để lưu vào Firebase
  Map<String, dynamic> toFirestore() {
    return {
      'serviceId': serviceId,
      'userId': userId,
      'carId': carId,
      'appointmentDate': appointmentDate,
      'status': status,
    };
  }
}
