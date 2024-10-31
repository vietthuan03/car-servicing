class ServiceModel {
  final String? id;
  final int index;
  final String title;
  final String imageUrl;
  final String description;
  final String price;

  ServiceModel(
      {this.id,
      this.index = 1,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.price});

  // Factory method to create a ServiceModel from Firebase data
  factory ServiceModel.fromFirestore(Map<String, dynamic> data, String docId) {
    return ServiceModel(
      id: docId,
      index: data['index'] ?? 1,
      title: data['title'] ?? '',
      imageUrl: data['logoUrl'] ?? '',
      description: data['description'] ?? '',
      price: data['price'] ?? '',
    );
  }

  // Method to convert ServiceModel to JSON format for Firebase storage
  Map<String, dynamic> toFirestore() {
    return {
      'index': index,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'price': price
    };
  }
}
