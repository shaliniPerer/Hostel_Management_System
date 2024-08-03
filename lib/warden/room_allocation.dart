import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostelapp/rooms/QR_Code.dart';
import 'package:hostelapp/rooms/add_student.dart';
import 'package:hostelapp/rooms/room_details.dart';
import 'package:hostelapp/warden/check_attendance.dart';
import 'package:hostelapp/warden/complains.dart';
import 'package:hostelapp/warden/messages.dart';
import 'package:hostelapp/warden/notifications.dart';

import 'warden.dart';

class RoomAllocation extends StatefulWidget {
  const RoomAllocation({Key? key}) : super(key: key);

  @override
  _RoomAllocationState createState() => _RoomAllocationState();
}

class _RoomAllocationState extends State<RoomAllocation> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  Widget buildAnimatedButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
    required String heroTag,
  }) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 1000),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Hero(
              tag: heroTag,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: color,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(text),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToAddStudent(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddStudent()),
    );
  }

  void _navigateToStudentDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const RoomDetails(
                roomId: '',
                studentName: '',
                studentId: '',
              )), // Replace with your student details page
    );
  }

  void _navigateToQrCode(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QrCode()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Allocation'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Warden(username: 'Warden'),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAnimatedButton(
              text: 'Add Student',
              color: Colors.red,
              onPressed: () => _navigateToAddStudent(context),
              heroTag: 'addStudent',
            ),
            SizedBox(height: 20),
            buildAnimatedButton(
              text: 'Rooms details',
              color: Colors.green,
              onPressed: () => _navigateToStudentDetails(context),
              heroTag: 'RoomDetails',
            ),
            SizedBox(height: 20),
            buildAnimatedButton(
              text: 'QR Code',
              color: Colors.blue,
              onPressed: () => _navigateToQrCode(context),
              heroTag: 'QRCode',
            ),
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
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Warden(username: ''),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckAttendance()),
              );
              break;
            case 2:
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SeeRequests()),
              // );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Complains()),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Notifications(username: ''),
                ),
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
