import 'package:car_servicing/models/service_model.dart';
import 'package:flutter/material.dart';

class ServiceCartProvider extends ChangeNotifier {
  int _serviceCount = 0;

  int get serviceCount => _serviceCount;

  void addService() {
    _serviceCount++;
    notifyListeners();
  }

  // Method to reset service count
  void resetServiceCount() {
    _serviceCount = 0;
    notifyListeners();
  }

  // Cập nhật serviceCount
  void updateServiceCount(int count) {
    _serviceCount = count;
    notifyListeners();
  }

  final Map<ServiceModel, int> _serviceCounts = {};

  int getServiceCount(ServiceModel service) {
    return _serviceCounts[service] ?? 0; // Return count or 0 if not added
  }

  void removeService(ServiceModel service) {
    if (_serviceCounts.containsKey(service) && _serviceCounts[service]! > 0) {
      _serviceCounts[service] = _serviceCounts[service]! - 1;
      if (_serviceCounts[service] == 0) {
        _serviceCounts.remove(service); // Remove service if count reaches 0
      }
      notifyListeners(); // Notify listeners so the UI updates
    }
  }
}
