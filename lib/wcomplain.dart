import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class wcomplain extends StatefulWidget {
  const wcomplain({super.key});

  @override
  State<wcomplain> createState() => _wcomplainState();
}

class _wcomplainState extends State<wcomplain> {
  // Reference to Firebase Realtime Database's 'complains' node.
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref().child('complains');

  // List to store the complaints from Firebase.
  List<Map<dynamic, dynamic>> complainList = [];

  @override
  void initState() {
    super.initState();
    _fetchComplains(); // Fetch complaints when the page is initialized.
  }

  // Function to fetch complains from Firebase
  void _fetchComplains() {
    _databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        setState(() {
          complainList = data.entries.map((entry) {
            return {'key': entry.key, ...entry.value};
          }).toList();
        });
      }
    });
  }

  // Function to approve a complaint
  void _approveComplain(String requestKey) {
    _databaseRef.child(requestKey).update({'status': 'approved'}).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Complaint approved!')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error approving complaint: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with custom height, styling, and title.
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Set the height of the AppBar.
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text(
            'Student Complains', // Title text of the AppBar.
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 20,
              color: Colors.white, // Set the text color to white.
            ),
          ),
        ),
      ),
      body: complainList.isEmpty
          ? const Center(child: Text('No complains yet'))
          : ListView.builder(
        itemCount: complainList.length,
        itemBuilder: (context, index) {
          final complain = complainList[index];
          return ListTile(
            title: Text('Category: ${complain['category']}'),
            subtitle: Text('Description: ${complain['description']}'),
            trailing: ElevatedButton(
              onPressed: () {
                _approveComplain(complain['key']);
              },
              child: const Text('Approve'),
            ),
          );
        },
      ),
    );
  }
}
