import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/infor_car/vehicle.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Điều hướng đến trang Home
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
          (Route<dynamic> route) => false,
        );
        break;
      case 1:
        // Điều hướng đến trang VehicleScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        break;
      case 2:
        // Điều hướng đến trang RecordsScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          label: 'Vehicles',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.file_copy,
            size: 30,
          ),
          label: 'Records',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        _navigateToPage(context, index);
      },
      backgroundColor: const Color(0xFFFFFFFF),
    );
  }
}
