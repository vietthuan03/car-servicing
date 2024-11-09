import 'package:flutter/material.dart';

import '../../widget/service_card.dart';
import '../../widget/service_card2.dart';

class VehicleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9FA),
      appBar: AppBar(
        title: const Text('Hello Thuan'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/user.jpg'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30, // Kích thước icon cho Home
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_car,
              size: 30, // Kích thước icon cho Vehicles
            ),
            label: 'Vehicles',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.file_copy,
              size: 30, // Kích thước icon cho Records
            ),
            label: 'Records',
          ),
        ],
        currentIndex: 1,
        // Set initial index to 1 for Vehicles screen
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          // Handle navigation based on index
          print('Tapped index: $index');
        },
        backgroundColor: Color(0xFFFFFFFF), // Set background color to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ServiceCard2(),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
              height: 32,
            ),
            ServiceCard(),
          ],
        ),
      ),
    );
  }
}
