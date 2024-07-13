import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostel/check_attendance.dart';
import 'package:hostel/complains.dart';
import 'package:hostel/messages.dart';
import 'package:hostel/notifications.dart';
import 'package:hostel/request_details.dart';
import 'package:hostel/warden.dart';

class CheckRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Requests'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Room Requests',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          RequestTile(
            title: 'Room A - Bed 1',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestDetails(
                    studentId: '12345', // Replace with actual student ID
                    roomNumber: 'Room A', // Replace with actual room number
                    bedNumber: 'Bed 1', // Replace with actual bed number
                    onAccept: () {
                      // Handle accept action
                    },
                    onReject: () {
                      // Handle reject action
                    },
                  ),
                ),
              );
            },
          ),
          // Add more room requests here

          // SizedBox(height: 20),
          // Text(
          //   'Maintenance Requests',
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          // RequestTile(
          //   title: 'Fix leaking faucet',
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => RequestDetails(
          //           studentId: '12346', // Replace with actual student ID
          //           roomNumber: 'Room B', // Replace with actual room number
          //           bedNumber: 'Bed 2', // Replace with actual bed number
          //           onAccept: () {
          //             // Handle accept action
          //           },
          //           onReject: () {
          //             // Handle reject action
          // },
          // ),
          //       ),
          //     );
          //   },
          // ),
          // Add more maintenance requests here

          SizedBox(height: 20),
          Text(
            'Other Requests',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          RequestTile(
            title: 'Request for extension',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestDetails(
                    studentId: '12347', // Replace with actual student ID
                    roomNumber: 'Room C', // Replace with actual room number
                    bedNumber: 'Bed 3', // Replace with actual bed number
                    onAccept: () {
                      // Handle accept action
                    },
                    onReject: () {
                      // Handle reject action
                    },
                  ),
                ),
              );
            },
          ),
          // Add more other requests here
        ],
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

class RequestTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const RequestTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}
