import 'package:flutter/material.dart';

import '../repository/service_status_repo.dart';

class ServiceStatusViewModel extends ChangeNotifier {
  final ServiceStatusRepository _repository = ServiceStatusRepository();

  // Cập nhật trạng thái dịch vụ
  Future<void> updateServiceStatus(String appointmentId, String status) async {
    await _repository.updateServiceStatus(appointmentId, status);
    notifyListeners();
  }

  // Gửi thông báo trạng thái đến người dùng
  Future<void> sendStatusNotification(String userId, String message) async {
    await _repository.sendStatusNotification(userId, message);
  }
}
