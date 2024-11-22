import 'package:car_servicing/presentation/pages/infor_car/add_car_screen.dart';
import 'package:car_servicing/presentation/pages/services/select_service.dart';
import 'package:car_servicing/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String id = 'home';

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap Column in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildUserGreeting(context),
              _buildSearchBar(),
              _buildServiceBanner(),
              _buildServiceSelectionGrid(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }

  Widget _buildUserGreeting(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddCarScreen()),
        );
      },
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/car.jpg'),
            radius: 25,
          ),
          const SizedBox(width: 10),
          const Text('Hello Thuan', style: TextStyle(fontSize: 20)),
        ],
      ),
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
      child: Image.asset('assets/images/banner.png',
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 36, color: Colors.blue),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
