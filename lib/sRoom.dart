import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';

class sRoom extends StatefulWidget {
  const sRoom({super.key});

  @override
  State<sRoom> createState() => _sRoomState();
}

class _sRoomState extends State<sRoom> {
  String? selectedRoom;
  String? selectedBed;

  List<String> rooms = [];
  List<String> beds = [];

  // Reference to the Firebase Realtime Database
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('rooms');

  @override
  void initState() {
    super.initState();
    _fetchRooms(); // Fetch rooms when the screen is initialized
  }

  // Function to fetch available rooms from Firebase
  void _fetchRooms() {
    databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        setState(() {
          rooms = data.keys.map((room) => room.toString()).toList();
        });
      }
    });
  }

  // Function to fetch available beds for the selected room
  void _fetchBeds(String room) {
    databaseRef.child(room).onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        setState(() {
          beds = data.entries
              .where((entry) => entry.value == 'available')
              .map((entry) => entry.key)
              .toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Set the height of the AppBar
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text(
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
            const SizedBox(height: 30),
            // Dropdown for selecting room
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Room Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.blueAccent.withOpacity(0.1),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              items: rooms.map((room) {
                return DropdownMenuItem(
                  value: room,
                  child: Text(
                    room,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRoom = value;
                  selectedBed = null; // Clear the selected bed when room changes
                  _fetchBeds(value!); // Fetch beds for the selected room
                });
              },
              value: selectedRoom,
            ),
            const SizedBox(height: 16),
            // Dropdown for selecting bed
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Available Bed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.blueAccent.withOpacity(0.1),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              items: beds.map((bed) {
                return DropdownMenuItem(
                  value: bed,
                  child: Text(
                    bed,
                    style: const TextStyle(fontSize: 16),
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
            const SizedBox(height: 30),

            // Request button
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
                  FirebaseDatabase.instance.ref('room_requests').push().set(requestData).then((_) {
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
                    const SnackBar(
                      content: Text('Please select both room and bed.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Request'),
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
          // Handle navigation
        },
      ),
    );
  }
}
