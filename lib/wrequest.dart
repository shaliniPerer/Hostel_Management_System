import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';// Import the Firebase Realtime Database package.

class wrequest extends StatefulWidget {
  const wrequest({Key? key}) : super(key: key); // Define a stateful widget for the warden page.

  @override
  _wrequestState createState() => _wrequestState(); // Create the state for the widget.
}

class _wrequestState extends State<wrequest> {
  // Reference to the Firebase Realtime Database's 'requests' node.
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref().child('requests');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with custom height, styling, and title.
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Set the height of the AppBar.
        child: AppBar(
          backgroundColor: Colors.blueAccent, // Set the background color to blue.
          centerTitle: true, // Center the title in the AppBar.
          title: const Text(
            'Student Requests', // Title text of the AppBar.
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 20,
              color: Colors.white, // Set the text color to white.
            ),
          ),
        ),
      ),
      // Body of the page which listens to real-time updates from Firebase.
      body: StreamBuilder(
        stream: _databaseRef.onValue, // Listen for changes in the 'requests' node of Firebase.
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the data.
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Display an error message if the data cannot be fetched.
            return const Center(child: Text('Error fetching data.'));
          }

          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            // Show a message if no requests are available in Firebase.
            return const Center(child: Text('No requests available.'));
          }

          // Convert the Firebase data (Map) into a list for easier display.
          final Map<dynamic, dynamic> requestMap = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
          final List<dynamic> requestList = requestMap.values.toList();

          // Create a ListView to display each request in a card.
          return ListView.builder(
            itemCount: requestList.length, // Number of requests to display.
            itemBuilder: (context, index) {
              final request = requestList[index]; // Fetch each request.
              return Card(
                margin: const EdgeInsets.all(8.0), // Add margin around the card.
                child: ListTile(
                  // Display the category of the request as the title.
                  title: Text('Category: ${request['category']}'),
                  // Display other details like description, username, status, and timestamp in the subtitle.
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description: ${request['description']}'), // Problem description.
                      Text('Username: ${request['username']}'), // Username of the student.
                      Text('Status: ${request['status']}'), // Current status of the request.
                      Text('Time: ${request['timestamp']}'), // Time when the request was made.
                    ],
                  ),
                  // Icon button to approve the request.
                  trailing: IconButton(
                    icon: const Icon(Icons.check), // Check icon for approving the request.
                    onPressed: () {
                      // Approve the request when the button is pressed.
                      _approveRequest(requestList[index]);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Function to approve or resolve the student request.
  void _approveRequest(dynamic request) {
    // Get the unique key for each request (assuming Firebase push() was used).
    final requestKey = request['key'];
    // Update the status of the request to 'approved' in the Firebase database.
    _databaseRef.child(requestKey).update({'status': 'approved'}).then((_) {
      // Show a success message after updating the status.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request approved!')),
      );
    }).catchError((error) {
      // Show an error message if there was an issue updating the request.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error approving request: $error')),
      );
    });
  }
}
