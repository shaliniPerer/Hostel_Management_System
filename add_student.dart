import 'package:flutter/material.dart';
import 'package:n_hostel/room_service.dart.dart';
import 'package:n_hostel/rooms/room_details.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final TextEditingController _roomIdController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final RoomService _roomService = RoomService();

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
      _roomService.addStudent(roomId, studentName, studentId).then((_) {
        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student added successfully')),
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
          SnackBar(content: Text('Failed to add student: $error')),
        );
      });
    } else {
      // Handle validation or error cases
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
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
    );
  }
}
