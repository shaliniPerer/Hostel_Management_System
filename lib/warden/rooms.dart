import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostelapp/Directmsg.dart';
import 'package:hostelapp/warden/complains.dart';
import 'package:hostelapp/warden/messages.dart';
import 'package:hostelapp/warden/notice.dart';
import 'package:hostelapp/warden/warden.dart';

class Rooms extends StatelessWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: sRoom(),
    );
  }
}

class sRoom extends StatefulWidget {
  const sRoom({super.key});

  @override
  State<sRoom> createState() => _sRoomState();
}

class _sRoomState extends State<sRoom> {
  final List<Widget> _pages = [
    Warden(
      username: '',
    ),
    Rooms(),
    Complains(),
    Messages(),
    Notice(),
    Direct_Msg(),
    // Add more pages here
  ];
  String? selectedRoom;
  String? selectedBed;

  final List<String> rooms = ['Room 1', 'Room 2', 'Room 3', 'Room 4', 'Room 5'];
  final List<String> beds = ['Bed 1', 'Bed 2', 'Bed 3'];

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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                  // Handle the request button press
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Room: $selectedRoom, Bed: $selectedBed requested!'),
                    ),
                  );
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
        index: 1,
        items: const [
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.hotel, size: 26, color: Colors.white),
          Icon(Icons.warning, size: 26, color: Colors.white),
          Icon(Icons.menu, size: 26, color: Colors.white),
          Icon(Icons.notification_add, size: 26, color: Colors.white),
          Icon(Icons.message, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            //  _page = index;
            // Update _page or navigate to a different screen based on index
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => _pages[index]),
            );
          });
        },
      ),
    );
  }
}
