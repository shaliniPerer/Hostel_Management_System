import 'package:flutter/material.dart';

class RoomDetails extends StatelessWidget {
  final String roomId;

  const RoomDetails({
    Key? key,
    required this.roomId,
    required String studentId,
    required String studentName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (roomId.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Room Details'),
        ),
        body: const Center(
          child: Text('Room ID is empty'),
        ),
      );
    }

    // Dummy data for testing
    List<Map<String, dynamic>> dummyData = [
      {'studentName': 'John Doe', 'studentId': '001'},
      {'studentName': 'Jane Smith', 'studentId': '002'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Details'),
      ),
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          final student = dummyData[index];
          return ListTile(
            title: Text(student['studentName']),
            subtitle: Text(student['studentId']),
          );
        },
      ),
    );
  }
}
