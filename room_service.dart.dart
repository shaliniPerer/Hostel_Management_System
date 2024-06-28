import 'package:cloud_firestore/cloud_firestore.dart';

class RoomService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addStudent(String roomId, String studentName, String studentId) {
    return _firestore
        .collection('rooms')
        .doc(roomId)
        .collection('students')
        .doc(studentId)
        .set({
      'studentName': studentName,
      'studentId': studentId,
    });
  }
}
