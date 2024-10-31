import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServiceImage extends StatelessWidget {
  final String documentId;

  const ServiceImage({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getImageUrl(documentId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator
        } else if (snapshot.hasError) {
          return Icon(Icons.error); // Show error icon
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No Image URL'); // Handle case where no URL is found
        }

        return Image.network(
          snapshot.data!,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.broken_image, size: 100, color: Colors.grey);
          },
        );
      },
    );
  }

  Future<String> getImageUrl(String documentId) async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('services') // Replace 'services' with your collection name
        .doc(documentId)
        .get();

    if (docSnapshot.exists) {
      return docSnapshot['imageUrl']; // Access the imageUrl field
    } else {
      throw Exception('Document does not exist');
    }
  }
}
