import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostelapp/warden/check_attendance.dart';
import 'package:hostelapp/warden/check_requests.dart';
import 'package:hostelapp/warden/complains.dart';
import 'package:hostelapp/warden/messages.dart';
import 'package:hostelapp/warden/notifications.dart';
import 'package:hostelapp/warden/warden.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  QrCode({super.key});

  @override
  State<QrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<QrCode> {
  TextEditingController UrlController = TextEditingController();

  @override
  void dispose() {
    UrlController.dispose();
    super.dispose();
  }

  void _sendQRCode() {
    // Implement your logic to send the QR code data
    final qrData = UrlController.text;
    if (qrData.isNotEmpty) {
      // Example: Display a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('QR Code sent successfully'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 20),
        ),
      );
      // Add your actual sending logic here
    } else {
      // Show an error message if the QR data is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please generate a QR Code first'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 20),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate QR Code'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (UrlController.text.isNotEmpty)
              QrImageView(
                data: UrlController.text,
                size: 200,
              ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: UrlController,
                decoration: InputDecoration(
                  hintText: 'Enter Your Data',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Enter Your Data',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('Generate QR Code')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: _sendQRCode, child: Text('Send QR Code')),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blueAccent,
        color: Colors.blueAccent,
        animationDuration: Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.back_hand, size: 26, color: Colors.white),
          Icon(Icons.request_page, size: 26, color: Colors.white),
          Icon(Icons.handyman_outlined, size: 26, color: Colors.white),
          Icon(Icons.notifications, size: 26, color: Colors.white),
          Icon(Icons.message, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Warden(
                          username: '', // Pass the username here
                        )),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckAttendance()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckRequests()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Complains()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Notifications(
                          username: '', // Pass the username here
                        )),
              );
              break;
            case 5:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Messages()),
              );
              break;
          }
        },
      ),
    );
  }
}
