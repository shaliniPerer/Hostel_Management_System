import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostelapp/warden/check_attendance.dart';
import 'package:hostelapp/warden/check_requests.dart';
import 'package:hostelapp/warden/messages.dart';
import 'package:hostelapp/warden/notifications.dart';
import 'package:hostelapp/warden/room_allocation.dart';
import 'package:hostelapp/warden/warden.dart';

class Complains extends StatelessWidget {
  const Complains({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'List of Complaints',
          style: TextStyle(fontSize: 20),
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
                          username: '',
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
                          username: '',
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

  Widget itemDashboard(String title, IconData iconData, Color background,
          BuildContext context) =>
      InkWell(
        onTap: () {
          if (title == 'Room \n Allocation') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RoomAllocation()),
            );
          } else if (title == 'Notifications') {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Notifications(
                        username: '',
                      )),
            );
          } else if (title == 'Check \n Requests') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckRequests()),
            );
          } else if (title == 'Complains') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Complains()),
            );
          } else if (title == 'Messages') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Messages()),
            );
          } else if (title == 'Check \n Attendance') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckAttendance()),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, color: Colors.white)),
              const SizedBox(height: 8),
              Text(title.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
        ),
      );
}
