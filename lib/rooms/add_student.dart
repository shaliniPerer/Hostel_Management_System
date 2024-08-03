import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostelapp/warden/check_attendance.dart';
import 'package:hostelapp/warden/check_requests.dart';
import 'package:hostelapp/warden/complains.dart';
import 'package:hostelapp/warden/messages.dart';
import 'package:hostelapp/warden/notifications.dart';
import 'package:hostelapp/rooms/room_details.dart';
import 'package:hostelapp/warden/warden.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final TextEditingController _roomIdController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();

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
    _roomIdController.dispose();
    _studentNameController.dispose();
    _studentIdController.dispose();
    super.dispose();
  }

  void _addStudent() {
    String roomId = _roomIdController.text.trim();
    String studentName = _studentNameController.text.trim();
    String studentId = _studentIdController.text.trim();

    if (roomId.isNotEmpty && studentName.isNotEmpty && studentId.isNotEmpty) {
      RoomService.addStudent(roomId, studentName, studentId).then((_) {
        // Show a success message in the center
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Student added successfully'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),
        );
        // Navigate to RoomDetails page after adding student
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomDetails(
              roomId: roomId,
              studentName: '',
              studentId: '',
            ),
          ),
        );
      }).catchError((error) {
        // Handle errors if any
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add student: $error'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),
        );
      });
    } else {
      // Handle validation or error cases
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields'),
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
        title: const Text('Add Student'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _roomIdController,
              decoration: const InputDecoration(labelText: 'Room ID'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _studentNameController,
              decoration: const InputDecoration(labelText: 'Student Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _studentIdController,
              decoration: const InputDecoration(labelText: 'Student ID'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addStudent,
              child: const Text('Add Student'),
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

class RoomService {
  static Future<void> addStudent(
      String roomId, String studentName, String studentId) {
    // Replace this with your actual Firestore operation
    // For example, creating a new document in a 'students' collection
    // under the specified 'roomId'.
    // You need to import 'package:cloud_firestore/cloud_firestore.dart';
    // and use FirebaseFirestore.instance to interact with Firestore.
    return Future.delayed(Duration(seconds: 2)); // Example delay for simulation
  }
}
