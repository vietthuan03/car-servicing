import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Danh sách sản phẩm
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Số lượng sản phẩm trong giỏ
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 2,
                    child: Row(
                      children: [
                        // Hình ảnh sản phẩm
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            'https://via.placeholder.com/100',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        // Thông tin sản phẩm
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tên sản phẩm $index',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Giá: \$${(index + 1) * 20}',
                                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      // Xử lý giảm số lượng
                                    },
                                  ),
                                  Text('1'),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      // Xử lý tăng số lượng
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Nút xóa
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Xử lý xóa sản phẩm
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Tổng cộng và nút thanh toán
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey.shade400,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tổng cộng:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('\$60', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý thanh toán
                  },
                  child: Text('Thanh toán'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Hàm main để chạy ứng dụng
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Cart UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartPage(),
    );
  }
}
