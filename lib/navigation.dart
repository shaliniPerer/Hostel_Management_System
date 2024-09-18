import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Shalini'),
            accountEmail: Text('shala@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'image/profile.jpg',
                  width: 90, // Added width here
                  height: 90, // Added height here
                  fit: BoxFit.cover, // Corrected fit property
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('image/back.jpg'), // Corrected the image path.
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.file_upload),
            title: const Text('Upload shot'), // Corrected 'text' to 'Text'.
            onTap: () => print('Upload tapped'),
          ),
        ],
      ),
    );
  }
}
