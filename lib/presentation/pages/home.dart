import 'package:car_servicing/presentation/pages/select_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Wrap Column in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildUserGreeting(),
              _buildSearchBar(),
              _buildServiceBanner(),
              _buildServiceSelectionGrid(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildUserGreeting() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('images/car.jpg'),
          // Replace with actual user image
          radius: 25,
        ),
        const SizedBox(width: 10),
        const Text('Hello Thuan', style: TextStyle(fontSize: 20)),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for a car service',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildServiceBanner() {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Image.asset('images/banner.png',
          fit: BoxFit.cover), // Replace with actual banner image
    );
  }

  Widget _buildServiceSelectionGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GridView.count(
        shrinkWrap: true,
        // Enable GridView to take only necessary space
        physics: const NeverScrollableScrollPhysics(),
        // Disable GridView's scroll
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: [
          _buildServiceIcon(context, 'Car Service', Icons.car_repair),
          _buildServiceIcon(context, 'Tyres & Wheel Care', Icons.settings),
          _buildServiceIcon(context, 'Denting & Painting', Icons.brush),
          _buildServiceIcon(context, 'AC Service & Repair', Icons.ac_unit),
          _buildServiceIcon(context, 'Car Cleaning', Icons.cleaning_services),
          _buildServiceIcon(context, 'Batteries', Icons.battery_charging_full),
          _buildServiceIcon(context, 'Clutch & Gearbox', Icons.build),
          _buildServiceIcon(context, 'Dry clean', Icons.local_laundry_service),
          _buildServiceIcon(context, 'Car Wash', Icons.local_car_wash),
        ],
      ),
    );
  }

  Widget _buildServiceIcon(BuildContext context, String label, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectServicePage()),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 36, color: Colors.blue),
              // const SizedBox(height: 2),
              Text(label,
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 6)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.directions_car), label: 'Vehicles'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Records'),
      ],
    );
  }
}