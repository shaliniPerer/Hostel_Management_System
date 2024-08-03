import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostelapp/student/sComplain.dart';
import 'package:hostelapp/student/sMessage.dart';
import 'package:hostelapp/student/sRequest.dart';
import 'package:hostelapp/student/sRoom.dart';
import 'package:hostelapp/student/student.dart';

class sNotification extends StatefulWidget {
  final String username;

  const sNotification({Key? key, required this.username}) : super(key: key);

  @override
  State<sNotification> createState() => _sNotificationState();
}

class _sNotificationState extends State<sNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 10, // Assuming you have 10 notifications
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Notification Title ${index + 1}'),
            subtitle: Text('Notification description goes here...'),
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            onTap: () {
              // Handle tapping on the notification
            },
          );
        },
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
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Student(username: widget.username),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => sRoom()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => sRequest()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => sMessage(
                          chatRoomId: '',
                        )),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      sNotification(username: widget.username),
                ),
              );
              break;
            case 5:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => sComplain()),
              );
              break;
          }
        },
      ),
    );
  }
}
