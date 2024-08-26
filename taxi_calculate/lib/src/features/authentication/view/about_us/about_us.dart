import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_calculate/src/constants/colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerBgColor,
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Welcome to TaxiCalculate!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'TaxiCalculate is designed specifically for taxi drivers, providing an essential tool to calculate your earnings and manage your finances with ease. Our app helps you track your income, expenses, and net profits, so you can stay on top of your financial health and focus on providing excellent service to your passengers.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Mission',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Our mission is to empower taxi drivers by offering a simple and efficient way to calculate earnings and manage financial records. We aim to make financial management straightforward and accessible, allowing you to maximize your income and reduce financial stress.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'What We Offer',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Earnings Calculation: Easily calculate your total earnings based on your rides.\n'
                  '• Expense Tracking: Keep track of your daily expenses, including fuel, maintenance, and other costs.\n'
                  '• Net Profit Calculation: See your clean money after expenses are deducted.\n'
                  '• Percentage Calculation: Calculate the percentage of income you need to set aside for taxes or savings.\n'
                  '• User-Friendly Interface: Our app is intuitive and easy to use, making financial management simple.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Why Choose Us?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Accurate Calculations: Our app ensures precise calculations of your earnings and expenses.\n'
                  '• Time-Saving: Spend less time on paperwork and more time driving with our efficient tracking system.\n'
                  '• Insightful Reports: Get detailed reports on your income, expenses, and net profit to help you make informed financial decisions.\n'
                  '• Secure Data: Your financial information is secure and private, stored safely within the app.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Story',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'TaxiCalculate was created by a group of financial experts and developers who understand the unique challenges faced by taxi drivers. We noticed that many drivers struggled with managing their finances effectively and wanted to create a solution tailored to their needs. TaxiCalculate is the result of our commitment to helping drivers take control of their financial future.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: 'support@taxicalculate.com'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email address copied to clipboard')),
                );
              },
              child: const Text(
                'muhammadalauddin290@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Add more content here if needed
          ],
        ),
      ),
    );
  }
}
