import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: editcarScreen(),
    );
  }
}

class editcarScreen extends StatefulWidget {
  @override
  _editcarScreenState createState() => _editcarScreenState();
}

class _editcarScreenState extends State<editcarScreen> {
  File? _image;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _carPlateController = TextEditingController();
  final TextEditingController _carBrandController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();
  final TextEditingController _carYearController = TextEditingController();
  final TextEditingController _vinController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Save form action here
      print("Form is valid. Save data.");
    } else {
      print("Form is invalid. Show error.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50, // Icon thêm ảnh lớn hơn
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.add_a_photo, size: 50, color: Colors.black54)
                        : null,
                  ),
                ),
                SizedBox(height: 15),
                CustomTextField(
                  label: 'Car Plate',
                  controller: _carPlateController,
                  hintText: 'Enter Car Plate',
                ),
                CustomTextField(
                  label: 'Car Brand Name',
                  controller: _carBrandController,
                  hintText: 'Enter Car Brand Name',
                ),
                CustomTextField(
                  label: 'Car Model',
                  controller: _carModelController,
                  hintText: 'Enter Car Model',
                ),
                CustomTextField(
                  label: 'Car Manufacture Year',
                  controller: _carYearController,
                  hintText: 'Enter Car Manufacture Year',
                ),
                CustomTextField(
                  label: 'Vehicle Identification Number (VIN)',
                  controller: _vinController,
                  hintText: 'Enter VIN',
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 330, // Chiều rộng của nút Save là 330
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Không bo góc
                      ),
                    ),
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  CustomTextField({
    required this.label,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Khoảng cách giữa các TextField ngắn lại
      child: SizedBox(
        width: 330, // Chiều rộng của TextField là 330
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Giảm chiều cao TextField
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorStyle: TextStyle(
                  fontSize: 12,
                  height: 0.8, // Giảm chiều cao lỗi để không dịch chuyển layout
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
            SizedBox(height: 5), // Khoảng trống dưới TextField để tránh di chuyển layout
          ],
        ),
      ),
    );
  }
}
