import 'package:flutter/material.dart';

import '../../widgets/bottom_action_add.dart';
import '../../widgets/review_widget.dart'; // Import review widget

class BasicServicePage extends StatelessWidget {
  const BasicServicePage({Key? key}) : super(key: key);

  // Di chuyển khai báo vào trong build
  @override
  Widget build(BuildContext context) {
    final GlobalKey<_ReviewWidgetState> reviewWidgetKey = GlobalKey<_ReviewWidgetState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn chỉnh các phần tử ra ngoài biên
          children: [
            const Text(
              'Basic Service',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                _showAddCommentDialog(context, (name, comment, rating) {
                  reviewWidgetKey.currentState?.addReview(name, comment, rating);
                });
              },
              child: const Text(
                "Add Comment",
                style: TextStyle(
                  color: Colors.blue, // Bạn có thể thay đổi màu sắc cho phù hợp
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

      ),
      body: Container(
        color: Colors.grey[100],
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
                        const Text('4 Hrs Taken',
                            style: TextStyle(fontSize: 14)),
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
                ReviewWidget(key: reviewWidgetKey),
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

  // Hàm để hiển thị hộp thoại thêm comment với nhiều trường thông tin
  void _showAddCommentDialog(BuildContext context, Function(String, String, double) onAddReview) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _commentController = TextEditingController();
    double _rating = 3.0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Add Comment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Tên người comment
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Your Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                // Nội dung comment
                TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    labelText: "Your Comment",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 10),

                // Số sao đánh giá
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Rating:", style: TextStyle(fontSize: 16)),
                    StarRating(
                      initialRating: _rating,
                      onRatingChanged: (newRating) {
                        _rating = newRating;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Nút hành động
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Đóng hộp thoại
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        onAddReview(_nameController.text, _commentController.text, _rating);
                        Navigator.of(context).pop(); // Đóng hộp thoại sau khi lưu
                      },
                      child: const Text("Add"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({Key? key}) : super(key: key);

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  List<Map<String, dynamic>> reviews = [
    {"name": "Gautam Singh", "comment": "The Basic Service package is a good choice to keep normal things in check. Highly recommended!", "rating": 4.5},
    {"name": "Gautam Singh", "comment": "Highly recommended!", "rating": 4.0},
    {"name": "huyle", "comment": "huyle comment to from vietnam", "rating": 4.5},
  ];

  // Hàm để thêm review
  void addReview(String name, String comment, double rating) {
    setState(() {
      reviews.add({"name": name, "comment": comment, "rating": rating});
    });
  }

  // Hàm để xóa review
  void deleteReview(int index) {
    setState(() {
      reviews.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Customers Reviews",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...reviews.asMap().map((index, review) {
          return MapEntry(
            index,
            Card(
              color: Colors.grey[100],
              child: ListTile(
                title: Text(review["name"], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review["comment"]),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (i) {
                        return Icon(
                          i < review["rating"] ? Icons.star : Icons.star_border,
                          color: Colors.yellow,
                        );
                      }),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Xóa review
                    deleteReview(index);
                  },
                ),
              ),
            ),
          );
        }).values.toList(),
      ],
    );
  }
}

class StarRating extends StatefulWidget {
  final double initialRating;
  final ValueChanged<double> onRatingChanged;

  const StarRating({
    Key? key,
    required this.initialRating,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1.0;
            });
            widget.onRatingChanged(_rating);
          },
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.yellow,
          ),
        );
      }),
    );
  }
}