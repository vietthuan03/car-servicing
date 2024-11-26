import 'package:flutter/material.dart';

import '../../../services/Auth_service.dart';
import '../../widgets/bottom_nav_bar.dart';

class CarProfileScreen extends StatefulWidget {
  const CarProfileScreen({super.key});

  @override
  State<CarProfileScreen> createState() => _CarProfileScreenState();
}

class _CarProfileScreenState extends State<CarProfileScreen> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    final authService = AuthService();
    final uid = authService.getCurrentUserId();
    if (uid != null) {
      final name = await authService.getUserName(uid);
      setState(() {
        userName = name;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle'),
        backgroundColor: Colors.blue,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/car.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Wrap Column in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // _buildUserGreeting(context, userName),
              const SizedBox(height: 16),
              _buildCarRecord(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 3),
    );
  }
}

Widget _buildCarRecord(BuildContext context) {
  // final userId = FirebaseAuth.instance.currentUser!.uid;
  return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Details Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Car Image
                    Image.asset(
                      'assets/car_image.png', // Add a car image asset here
                      width: 100,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16),
                    // Car Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Baleno',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'MH 04 CD 1234',
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                          Text(
                            'Reg ID: 1421451223',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add service booking logic here
                          },
                          child: const Text('BOOK A SERVICE'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Add delete car logic here
                          },
                          child: const Text(
                            'DELETE',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Add Another Car Section
            const Text(
              'Add Another Car',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Registration ID...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add car logic here
                  },
                  child: const Text('ADD CAR'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
