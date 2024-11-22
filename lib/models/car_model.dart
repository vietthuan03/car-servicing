class CarModel {
  final String id; // Firestore document ID
  final String carPlate;
  final String carBrand;
  final String carModel;
  final String carYear;
  final String vin;

  // final String? imageUrl;

  CarModel({
    required this.id,
    required this.carPlate,
    required this.carBrand,
    required this.carModel,
    required this.carYear,
    required this.vin,
    // this.imageUrl,
  });

  // Chuyển dữ liệu từ Firestore
  factory CarModel.fromFirestore(Map<String, dynamic> data, String docId) {
    return CarModel(
      id: docId,
      carPlate: data['carPlate'],
      carBrand: data['carBrand'],
      carModel: data['carModel'],
      carYear: data['carYear'],
      vin: data['vin'],
      // imageUrl: data['imageUrl'],
    );
  }

  // Chuyển thành Map để lưu vào Firestore
  Map<String, dynamic> toMap() {
    return {
      'carPlate': carPlate,
      'carBrand': carBrand,
      'carModel': carModel,
      'carYear': carYear,
      'vin': vin,
      // 'imageUrl': imageUrl,
    };
  }
}
