import 'package:flutter/material.dart';

import '../widgets/bottom_action_add.dart';
import '../widgets/review_widget.dart'; // Import review widget

class BasicServicePage extends StatelessWidget {
  const BasicServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Text(
              'Basic Service',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[100], // Background color for the entire scrollable area
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service Information
                Text(
                  'Service information',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'images/base.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        const Text('4 Hrs Taken', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset('images/base_1.png', width: 24, height: 24),
                        SizedBox(width: 8),
                        const Text('1000 Kms or 1 Month Warranty',
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset('images/base_2.png', width: 24, height: 24),
                        SizedBox(width: 8),
                        const Text('Every 5000 Kms or 3 Months',
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset('images/base_3.png', width: 24, height: 24),
                        SizedBox(width: 8),
                        const Text('Free Pick-up or Drop',
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // What's Included Section
                const Text(
                  'What’s included?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Service items
                ..._buildServiceItems([
                  'Engine Oil Replacement',
                  'Oil Filter Replacement',
                  'Air Filter Cleaning',
                  'Coolant Top up',
                  'Wiper Fluid Replacement',
                  'Battery Water Top up',
                  'Heater/Spark Plugs Checking',
                  'Car Wash',
                  'Interior Vacuuming (Carpet & Seats)',
                ]),
                SizedBox(height: 8),
                // Reviews
                const ReviewWidget(),
                SizedBox(height: 8),
                // Action Button
                const BottomActionAddWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildServiceItems(List<String> items) {
  return items
      .map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Image.asset(
                  'images/tick.png',
                ),
                const SizedBox(width: 8),
                Text(
                  item,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ))
      .toList();
}
