import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:untitled1/sComplain.dart';
import 'package:untitled1/sMessage.dart';
import 'package:untitled1/sRequest.dart';
import 'package:untitled1/student.dart';

class sRoom extends StatefulWidget {
  const sRoom({super.key});

  @override
  State<sRoom> createState() => _sRoomState();
}

class _sRoomState extends State<sRoom> {
  String? selectedRoom;
  String? selectedBed;

  final List<String> rooms = ['Room 1', 'Room 2', 'Room 3', 'Room 4', 'Room 5'];
  final List<String> beds = ['Bed 1', 'Bed 2', 'Bed 3'];

  // Reference to the Firebase Realtime Database
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('room_requests');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set the height of the AppBar
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text(
            'Room Availability',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Room Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.blueAccent.withOpacity(0.1),
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              items: rooms.map((room) {
                return DropdownMenuItem(
                  value: room,
                  child: Text(
                    room,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRoom = value;
                });
              },
              value: selectedRoom,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Available Bed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.blueAccent.withOpacity(0.1),
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              items: beds.map((bed) {
                return DropdownMenuItem(
                  value: bed,
                  child: Text(
                    bed,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBed = value;
                });
              },
              value: selectedBed,
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                if (selectedRoom != null && selectedBed != null) {
                  // Prepare the data to be sent to Firebase
                  Map<String, dynamic> requestData = {
                    'room': selectedRoom,
                    'bed': selectedBed,
                    'timestamp': DateTime.now().toIso8601String(),
                    'status': 'pending', // Default status
                  };

                  // Push the request data to Firebase Realtime Database
                  databaseRef.push().set(requestData).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Room: $selectedRoom, Bed: $selectedBed requested successfully!'),
                      ),
                    );

                    // Clear the form
                    setState(() {
                      selectedRoom = null;
                      selectedBed = null;
                    });
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to request room: $error'),
                      ),
                    );
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select both room and bed.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Text('Request'),
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
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Student(username: "username"),
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
                MaterialPageRoute(builder: (context) => sMessage()),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => sRoom(),
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
