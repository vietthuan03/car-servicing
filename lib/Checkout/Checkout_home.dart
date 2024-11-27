import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  // Hàm kiểm tra định dạng email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@gmail\.com$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Vui lòng nhập email hợp lệ với định dạng @gmail.com';
    }
    return null;
  }

  // Hàm kiểm tra số điện thoại
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    String pattern = r'^\d{10}$'; // Kiểm tra đúng 10 chữ số
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Số điện thoại phải có 10 chữ số';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh Toán'),
        backgroundColor: Colors.green,
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false, // Loại bỏ thanh cuộn
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 1000, // Chiều rộng form
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'THÔNG TIN THANH TOÁN',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    // Tên và Họ
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Tên *',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập tên';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Họ *',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập họ';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Tên công ty
                    // Quốc gia/Khu vực
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Quốc gia/Khu vực *',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng chọn quốc gia/khu vực';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Địa chỉ
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Địa chỉ *',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập địa chỉ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Tỉnh/Thành phố và Mã bưu điện
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Tỉnh / Thành phố *',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập tỉnh/thành phố';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Mã bưu điện *',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập mã bưu điện';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Số điện thoại và Email
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Số điện thoại *',
                              border: OutlineInputBorder(),
                            ),
                            validator: _validatePhone, // Kiểm tra số điện thoại
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Địa chỉ email *',
                              border: OutlineInputBorder(),
                            ),
                            validator: _validateEmail,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    // Đơn hàng của bạn
                    Text(
                      'ĐƠN HÀNG CỦA BẠN',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text('Đèn LED Bong Bóng Helium Phát Sáng'),
                      trailing: Text('585,000đ'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Tạm tính'),
                      trailing: Text('585,000đ'),
                    ),
                    ListTile(
                      title: Text(
                        'Tổng',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '585,000đ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Phương thức thanh toán
                    Text(
                      'Phương thức thanh toán',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {},
                      title: Text('Chuyển khoản ngân hàng'),
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: 1,
                      onChanged: (value) {},
                      title: Text('Trả tiền mặt khi nhận hàng'),
                    ),
                    SizedBox(height: 20),
                    // Nút Đặt Hàng
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Đặt hàng thành công!')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          backgroundColor: Colors.orange,
                        ),
                        child: Text(
                          'ĐẶT HÀNG',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CheckoutPage(),
  ));
}
