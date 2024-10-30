import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarServiceAnimationPage extends CupertinoPageRoute {
  CarServiceAnimationPage()
      : super(builder: (BuildContext context) => new CarBooking());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(
        opacity: animation, child: new CarBooking());
  }
}

class CarBooking extends StatefulWidget {
  @override
  _CarBookingState createState() => _CarBookingState();
}

class _CarBookingState extends State<CarBooking> {
  late TextEditingController _nameController,
      _addressController,
      _wardController,
      _mobilenumberController;

  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _wardController = TextEditingController();
    _mobilenumberController = TextEditingController();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.teal,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text(
                "Car Reparing",
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0),
              ),
              background: Image.asset(
                'assets/images/car.jpg',
                fit: BoxFit.cover,
              ),
            ),
            centerTitle: true,
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 18.0,
                  ),

                  //Full Name
                  TextField(
                    controller: _nameController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: 'Example:Jon Legend',
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),

                  //Address
                  TextFormField(
                    controller: _addressController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_location),
                      hintText: 'Example: Bhairahawa,Rupandehi',
                      labelText: 'Enter Address',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),

                  //Ward No.
                  TextFormField(
                    controller: _wardController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.blur_linear),
                      hintText: 'Example: Ward-10',
                      labelText: 'Enter Ward Number',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),

                  SizedBox(
                    height: 12.0,
                  ),

                  //Mobile Number
                  TextFormField(
                    controller: _mobilenumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_iphone),
                      hintText: 'Example: 98********',
                      labelText: 'Enter Mobile Number',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightGreen)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),

                  SizedBox(height: 12.0),

                  Text(
                    "Give your location access",
                    style: TextStyle(fontFamily: 'Rubik', fontSize: 16.0),
                  ),

                  //Location Button
                  IconButton(
                      icon: Icon(
                        Icons.my_location,
                        color: Colors.indigo,
                        size: 30.0,
                      ),
                      onPressed: () {}),

                  SizedBox(
                    height: 15.0,
                  ),

                  //Book Button
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Book Service',
                      style:
                      TextStyle(fontFamily: 'Rubik', color: Colors.white),
                    ),
                  )
                ])),
          )
        ],
      ),
    );
  }
}
