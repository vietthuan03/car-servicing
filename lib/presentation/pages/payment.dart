import 'package:car_servicing/presentation/pages/checkout.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentPage> {
  String? selectedPaymentMethod = "pay_after";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                    (Route<dynamic> route) => false,
                  )
                }),
      ),
      body: Container(
        color: Colors.grey[100],
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAmountRow('Service Total', '2.499.000 VND'),
                _buildAmountRow('Convenience Charges', '100.000 VND'),
                _buildAmountRow(
                  'Service Amount Payable',
                  '2.599.000 VND',
                  isBold: true,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Apply Coupon',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Coupon Code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('APPLY'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildAmountRow('Amount Payable', '2.599.000 VND'),
                const SizedBox(height: 20),
                const Text(
                  'Pay Using',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildPaymentOption(
                  'paytm',
                  'Pay via PayTM',
                  'images/pay_tm.png',
                ),
                _buildPaymentOption(
                  'gpay',
                  'Pay via Google Pay',
                  'images/google_pay.png',
                ),
                _buildPaymentOption(
                  'card',
                  'Pay via Debit/Credit Card',
                  'images/card.png',
                ),
                _buildPaymentOption(
                  'pay_after',
                  'Pay after the service',
                  'images/pay_after.png',
                ),
                const SizedBox(height: 100),
                // Extra space at the bottom to avoid overflow
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Basic Service\n2.599.000 VND',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                'PAY',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountRow(String title, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String value, String title, String iconPath) {
    return RadioListTile(
      value: value,
      groupValue: selectedPaymentMethod,
      onChanged: (String? newValue) {
        setState(() {
          selectedPaymentMethod = newValue;
        });
      },
      title: Text(title),
      secondary: Image.asset(
        iconPath,
        width: 24,
        height: 24,
      ),
    );
  }
}
