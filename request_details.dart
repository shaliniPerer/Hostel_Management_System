import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostel/check_attendance.dart';
import 'package:hostel/check_requests.dart';
import 'package:hostel/complains.dart';
import 'package:hostel/messages.dart';
import 'package:hostel/notifications.dart';

import 'warden.dart'; // Added import

class RoomAllocation extends StatefulWidget {
  const RoomAllocation({Key? key}) : super(key: key);

  get username => null;

  @override
  State<RoomAllocation> createState() => _RoomAllocationState();
}

class _RoomAllocationState extends State<RoomAllocation> {
  final List<Map<String, String>> roomRequests = [
    {'student': 'Student A', 'room': 'Room 1', 'bed': 'Bed 1'},
    {'student': 'Student B', 'room': 'Room 2', 'bed': 'Bed 2'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(100.0), // Set the height of the AppBar
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text(
            'Room Allocation',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Room Requests',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: roomRequests.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      title: Text(
                        'Request ${index + 1}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestDetails(
                              studentId: roomRequests[index]['student']!,
                              roomNumber: roomRequests[index]['room']!,
                              bedNumber: roomRequests[index]['bed']!,
                              onAccept: () {
                                setState(() {
                                  roomRequests.removeAt(index);
                                });
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Request accepted.'),
                                  ),
                                );
                              },
                              onReject: () {
                                setState(() {
                                  roomRequests.removeAt(index);
                                });
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Request rejected.'),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
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
}

RequestDetails(
    {required String studentId,
    required String roomNumber,
    required String bedNumber,
    required Null Function() onAccept,
    required Null Function() onReject}) {}
