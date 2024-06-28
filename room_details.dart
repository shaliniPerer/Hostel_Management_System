import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoomDetails extends StatelessWidget {
  final String roomId;

  const RoomDetails({
    Key? key,
    required this.roomId,
    required String studentName,
    required String studentId,
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Room Details'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('rooms')
            .doc(roomId)
            .collection('students')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final students = snapshot.data!.docs;

          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return ListTile(
                title: Text(student['studentName']),
                subtitle: Text(student['studentId']),
              );
            },
          );
        },
      ),
    );
  }
}
