import 'package:flutter/material.dart';

import '../models/payment_model.dart';
import '../repository/payment_repo.dart';

class PaymentViewModel extends ChangeNotifier {
  final PaymentRepository _repository = PaymentRepository();

  // Xử lý thanh toán
  Future<void> processPayment(PaymentModel payment) async {
    await _repository.processPayment(payment);
    notifyListeners();
  }

  // Lấy danh sách thanh toán của người dùng
  Stream<List<PaymentModel>> getUserPayments(String userId) {
    return _repository.getUserPayments(userId);
  }
}
