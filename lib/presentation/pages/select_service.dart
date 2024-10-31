import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/service_model.dart';
import '../widgets/service_card.dart';
import 'home.dart';

class SelectServicePage extends StatelessWidget {
  // Tạo tham chiếu đến collection 'services' trên Firebase
  final CollectionReference servicesCollection =
      FirebaseFirestore.instance.collection('services');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Service'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: servicesCollection.snapshots(),
        // Lắng nghe thay đổi từ Firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong!'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No services available'));
          }

          // Chuyển đổi dữ liệu từ Firestore thành danh sách ServiceModel
          List<ServiceModel> services = snapshot.data!.docs.map((doc) {
            return ServiceModel.fromFirestore(
                doc.data() as Map<String, dynamic>, doc.id);
          }).toList();

          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              return ServiceCard(service: services[index]);
            },
          );
        },
      ),
    );
  }
}
