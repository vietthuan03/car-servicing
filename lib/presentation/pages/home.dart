import 'package:car_servicing/presentation/pages/select_service.dart';
import 'package:car_servicing/responsive/ResponsiveWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
	const Home({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Padding(
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
			bottomNavigationBar: _buildBottomNavigationBar(),
		);
	}

	Widget _buildUserGreeting() {
		return const Row(
			children: [
				CircleAvatar(
					backgroundImage: AssetImage('/images/car.jpg'), // Replace with actual user image
					radius: 25,
				),
				SizedBox(width: 10),
				Text('Hello Thuan', style: TextStyle(fontSize: 20)),
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
					prefixIcon: Icon(Icons.search),
				),
			),
		);
	}

	Widget _buildServiceBanner() {
		return Container(
			height: 150,
			child: Image.asset('/images/banner.png', fit: BoxFit.cover), // Replace with actual banner image
		);
	}

	Widget _buildServiceSelectionGrid(BuildContext context) {
		return Expanded(
			child: GridView.count(
				crossAxisCount: ResponsiveWidget.isMobile(context) ? 3 : 4,
				crossAxisSpacing: 10,
				mainAxisSpacing: 10,
				children: [
					// Wrap each service icon with GestureDetector to add navigation
					_buildServiceIcon(context, 'Car Service', Icons.car_repair),
					_buildServiceIcon(context, 'Tyres & Wheel Care', Icons.settings),
					_buildServiceIcon(context, 'Denting & Painting', Icons.brush),
					_buildServiceIcon(context, 'AC Service & Repair', Icons.ac_unit),
					_buildServiceIcon(context, 'Car Cleaning', Icons.cleaning_services),
					_buildServiceIcon(context, 'Batteries', Icons.battery_charging_full),
					_buildServiceIcon(context, 'Clutch & Gearbox', Icons.build),
					_buildServiceIcon(context, 'Dry clean', Icons.local_laundry_service),
					_buildServiceIcon(context, 'Car Wash', Icons.local_car_wash),
					_buildServiceIcon(context, 'Oil Change', Icons.oil_barrel),
				],
			),
		);
	}

	Widget _buildServiceIcon(BuildContext context, String label, IconData icon) {
		return GestureDetector(
			onTap: () {
				// Navigate to SelectServicePage when the icon is tapped
				Navigator.push(
					context,
					MaterialPageRoute(builder: (context) => SelectServicePage()),
				);
			},
			child: Column(
				mainAxisSize: MainAxisSize.min,
				children: [
					Icon(icon, size: 36, color: Colors.blue),
					SizedBox(height: 8),
					Text(label, textAlign: TextAlign.center),
				],
			),
		);
	}

	Widget _buildBottomNavigationBar() {
		return BottomNavigationBar(
			items: [
				BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
				BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Vehicles'),
				BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Records'),
			],
		);
	}
}
