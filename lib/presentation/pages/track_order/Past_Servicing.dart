import 'package:flutter/material.dart';

import '../../widgets/Button_up_past.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Ẩn banner "DEBUG"
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPastSelected = false;
  List<bool> isSelected = [true, false];
  int _selectedIndex = 2; // Đặt tab "Records" làm mặc định

  void toggleUpcoming() {
    setState(() {
      isSelected = [true, false];
      isPastSelected = false;
    });
  }

  void togglePast() {
    setState(() {
      isSelected = [false, true];
      isPastSelected = true;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello +....'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ButtonToggle(
              isUpcomingSelected: isSelected[0],
              isPastSelected: isSelected[1],
              onUpcomingTap: toggleUpcoming,
              onPastTap: togglePast,
            ),
            SizedBox(height: 16),
            if (isPastSelected) ...[
              ServiceCard(),
              ServiceCard2(),
              BookAgainButton(),
            ] else
              Center(
                child: Text(
                  'Upcoming orders will appear here.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car,
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
            label: 'Vehicles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt,
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
            label: 'Records',
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Service',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Booking ID: 123456789',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.green,
                  ),
                ),
                child: Text(
                  'COMPLETED',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General Motors',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Date',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '9th Jan 2024, Monday',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star_border, color: Colors.amber, size: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookAgainButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          print("Booking again...");
        },
        child: Text(
          'BOOK AGAIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
