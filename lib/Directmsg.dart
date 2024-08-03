import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostelapp/warden/check_attendance.dart';
import 'package:hostelapp/warden/check_requests.dart';
import 'package:hostelapp/warden/complains.dart';
import 'package:hostelapp/warden/messages.dart';
import 'package:hostelapp/warden/notifications.dart';
import 'package:hostelapp/warden/warden.dart';

class Direct_Msg extends StatelessWidget {
  const Direct_Msg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DirrectM(),
    );
  }
}

class DirrectM extends StatefulWidget {
  const DirrectM({Key? key}) : super(key: key);

  @override
  State<DirrectM> createState() => _DirrectMState();
}

class _DirrectMState extends State<DirrectM> {
  final TextEditingController roomController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  String _messageStatus = '';

  final List<Widget> _pages = [
    Warden(username: ''),
    CheckAttendance(),
    CheckRequests(),
    Complains(),
    Notifications(username: ''),
    Messages(),
  ];

  @override
  void dispose() {
    roomController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    setState(() {
      if (messageController.text.isEmpty) {
        _messageStatus = 'Message sent unsuccessfully';
      } else {
        _messageStatus = 'Message sent successfully';
        roomController.clear();
        messageController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Direct Message'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30.0),
            TextFormField(
              controller: roomController,
              maxLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                labelText: 'Student ID',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: messageController,
              maxLines: 7,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                labelText: 'Enter Your Message',
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _sendMessage,
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // button press action for View Reply
                  },
                  child: Text(
                    'View Reply',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              _messageStatus,
              style: TextStyle(
                fontSize: 16.0,
                color: _messageStatus == 'Message sent successfully'
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blueAccent,
        color: Colors.blueAccent,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.back_hand, size: 26, color: Colors.white),
          Icon(Icons.request_page, size: 26, color: Colors.white),
          Icon(Icons.handyman_outlined, size: 26, color: Colors.white),
          Icon(Icons.notifications, size: 26, color: Colors.white),
          Icon(Icons.message, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
        },
      ),
    );
  }
}
