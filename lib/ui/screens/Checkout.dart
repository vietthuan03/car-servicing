import 'package:car_servicing/responsive/ResponsiveWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<String> availableDates = ['Today 21', 'Tomorrow 22', 'Wed 23', 'Thu 24'];
  int selectedDateIndex = 0;
  int selectedTimeSlotIndex = -1;

  List<String> timeSlots = [
    '08:00 - 08:30', '09:00 - 09:30', '09:30 - 10:00', '10:00 - 10:30',
    '10:30 - 11:00', '11:00 - 11:30', '13:30 - 14:00', '14:00 - 14:30',
    '14:30 - 15:00', '15:00 - 15:30', '15:30 - 16:00', '16:30 - 17:00'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Pick-up Address',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'When do you want the service?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              // flex: ResponsiveWidget.isTablet(context)? 2:1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Date',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 50.0,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          selectedDateIndex = index;
                        });
                      },
                    ),
                    items: availableDates.map((date) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 4,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: selectedDateIndex ==
                                      availableDates.indexOf(date)
                                  ? Colors.blue[100]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Center(
                              child: Text(
                                date,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Select Pick-up Time Slot',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    flex: ResponsiveWidget.isDesktop(context) ? 2 : 1,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      // Disable scrolling within the GridView
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 3,
                      ),
                      itemCount: timeSlots.length,
                      itemBuilder: (context, index) {
                        return ChoiceChip(
                          label: Text(timeSlots[index]),
                          selected: selectedTimeSlotIndex == index,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedTimeSlotIndex = selected ? index : -1;
                            });
                          },
                          selectedColor: Colors.blue[100],
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Basic Service 2.599.000 VND',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: selectedTimeSlotIndex != -1
                  ? () {
                      // Handle Proceed Action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Proceeding with booking...'),
                        ),
                      );
                    }
                  : null,
              child: Text('PROCEED'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
