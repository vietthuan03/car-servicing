import 'package:flutter/material.dart';
import '../models/service_model.dart';

class ServiceCartViewModel extends ChangeNotifier {
  final List<ServiceModel> _serviceCart = [];

  List<ServiceModel> get serviceCart => _serviceCart;

  // Thêm dịch vụ vào giỏ hàng
  void addToCart(ServiceModel service) {
    _serviceCart.add(service);
    notifyListeners(); // Cập nhật UI
  }
}
