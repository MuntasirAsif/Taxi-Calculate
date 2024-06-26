import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_calculate/src/constants/colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    const String email = 'muhammadalauddin290@gmail.com';

    void copyEmailToClipboard(BuildContext context) {
      Clipboard.setData(const ClipboardData(text: email));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email address copied to clipboard'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: headerBgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'We\'d love to hear from you!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'If you have any questions, comments, or concerns, please feel free to reach out to us at:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => copyEmailToClipboard(context),
              child: const Text(
                email,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            // Add social media links or other contact methods here
          ],
        ),
      ),
    );
  }
}
