import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostel/Directmsg.dart';
import 'package:hostel/complains.dart';
import 'package:hostel/messages.dart';
import 'package:hostel/rooms.dart';
import 'package:hostel/warden.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Noticeee(),
    );
  }
}

class Noticeee extends StatefulWidget {
  const Noticeee({Key? key}) : super(key: key);

  @override
  State<Noticeee> createState() => _NoticeeeState();
}

class _NoticeeeState extends State<Noticeee> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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

  final TextEditingController _noticeController = TextEditingController();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set the height of the AppBar
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text(
            'Notice',
            style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Center(
              child: TextFormField(
            controller: _noticeController,
            maxLines: 7, // Set the maximum number of lines
            decoration: InputDecoration(
              filled: true, // Set the background color
              fillColor:
                  Colors.grey[300], // Set the background color to ash color
              border: OutlineInputBorder(
                // Set the border
                borderRadius:
                    BorderRadius.circular(10), // Set the border radius
                borderSide: BorderSide(
                    color: Colors.blue), // Set the border color to blue
              ),
              enabledBorder: OutlineInputBorder(
                // Set the enabled border
                borderRadius:
                    BorderRadius.circular(10), // Set the border radius
                borderSide: BorderSide(
                    color: Colors.blue), // Set the border color to blue
              ),
              focusedBorder: OutlineInputBorder(
                // Set the focused border
                borderRadius:
                    BorderRadius.circular(10), // Set the border radius
                borderSide: BorderSide(
                    color: Colors.blue), // Set the border color to blue
              ),
              labelText: 'Enter Your Notice',
            ),
          )),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // border radius
              ),
            ),
            onPressed: () {
              setState(() {
                if (_noticeController.text.isEmpty) {
                  _message = 'Message sent unsuccessfully';
                } else {
                  _message = 'Message sent successfully';
                }
              });
            },
            child: Text(
              'Send',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            _message,
            style: TextStyle(
              fontSize: 16.0,
              color: _message == 'Message sent successfully'
                  ? Colors.green
                  : Colors.red,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blueAccent,
        color: Colors.blueAccent,
        animationDuration: const Duration(milliseconds: 300),
        index: 4,
        items: const [
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.back_hand, size: 26, color: Colors.white),
          Icon(Icons.request_page, size: 26, color: Colors.white),
          Icon(Icons.handyman_outlined, size: 26, color: Colors.white),
          Icon(Icons.notifications, size: 26, color: Colors.white),
          Icon(Icons.message, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
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
