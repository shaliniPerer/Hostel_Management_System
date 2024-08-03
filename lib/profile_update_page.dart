import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileUpdatePage extends StatefulWidget {
  @override
  _ProfileUpdatePageState createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _photoURLController = TextEditingController();

  Future<void> _updateProfile() async {
    User? user = _auth.currentUser;

    if (user != null) {
      await user.updateDisplayName(_displayNameController.text);
      await user.updatePhotoURL(_photoURLController.text);
      await storeOrUpdateUserData(user);

      // Refresh user data
      await user.reload();
      user = _auth.currentUser;

      // Show success message or navigate back
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  Future<void> storeOrUpdateUserData(User user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    await users.doc(user.uid).update({
      'displayName': user.displayName,
      'photoURL': user.photoURL,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _displayNameController,
              decoration: InputDecoration(labelText: "Display Name"),
            ),
            TextField(
              controller: _photoURLController,
              decoration: InputDecoration(labelText: "Photo URL"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile,
              child: Text("Update Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
