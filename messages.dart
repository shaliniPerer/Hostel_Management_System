// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:hostel/check_attendance.dart';
// import 'package:hostel/complains.dart';

// // import 'package:t_one/room_allocation.dart';

// import 'notifications.dart';
// import 'warden.dart';

// class Messages extends StatefulWidget {
//   @override
//   _MessagesState createState() => _MessagesState();
// }

// class _MessagesState extends State<Messages> with TickerProviderStateMixin {
//   final List<ChatMessage> _messages = [];
//   final TextEditingController _controller = TextEditingController();

//   // List of users to chat with
//   final List<String> users = [
//     '202155',
//     '202130',
//     '202133',
//     '202046',
//   ];
//   String? selectedUser;
//   String appBarTitle = 'Messages'; // Default app bar title

//   @override
//   void initState() {
//     super.initState();
//     // Set the initial selected user
//     selectedUser = users.first;
//   }

//   void _handleSubmitted(String text) {
//     _controller.clear();
//     ChatMessage message = ChatMessage(
//       text: text,
//       animationController: AnimationController(
//         duration: const Duration(milliseconds: 700),
//         vsync: this,
//       ),
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//     message.animationController.forward();
//   }

//   Widget _buildTextComposer() {
//     return IconTheme(
//       data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: <Widget>[
//             Flexible(
//               child: TextField(
//                 controller: _controller,
//                 onSubmitted: _handleSubmitted,
//                 decoration: InputDecoration.collapsed(
//                   hintText: 'Send a message',
//                   hintStyle: TextStyle(color: Colors.grey),
//                 ),
//                 style: TextStyle(color: Colors.black87),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 4.0),
//               child: IconButton(
//                 icon: Icon(Icons.send, color: Colors.blueAccent),
//                 onPressed: () => _handleSubmitted(_controller.text),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (ChatMessage message in _messages) {
//       message.animationController.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(100.0),
//         child: AppBar(
//           backgroundColor: Colors.blueAccent,
//           centerTitle: true,
//           title: Column(
//             children: [
//               Text(
//                 appBarTitle,
//                 style: TextStyle(
//                   fontFamily: 'RobotoMono',
//                   fontSize: 20,
//                   color: Colors.white,
//                 ),
//               ),
//               if (selectedUser !=
//                   null) // Show selected user's name if available
//                 Text(
//                   selectedUser!,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//             ],
//           ),
//           actions: [
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//               padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 color: Colors.blueAccent.withOpacity(0.8),
//               ),
//               child: PopupMenuButton<String>(
//                 icon: Icon(Icons.arrow_drop_down_circle_rounded,
//                     color: Colors.white),
//                 onSelected: (String value) {
//                   setState(() {
//                     selectedUser = value;
//                     appBarTitle = 'Messages'; // Reset app bar title
//                   });
//                 },
//                 itemBuilder: (BuildContext context) {
//                   return users.map((String user) {
//                     return PopupMenuItem<String>(
//                       value: user,
//                       child: Text(
//                         user,
//                         style: TextStyle(
//                           color: const Color.fromARGB(255, 17, 10, 0),
//                         ),
//                       ),
//                     );
//                   }).toList();
//                 },
//               ),
//             ),
//           ],
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const Warden(username: 'Warden'),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Flexible(
//             child: ListView.builder(
//               padding: EdgeInsets.all(8.0),
//               reverse: true,
//               itemBuilder: (_, int index) => _messages[index],
//               itemCount: _messages.length,
//             ),
//           ),
//           Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(color: Theme.of(context).cardColor),
//             child: _buildTextComposer(),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.transparent,
//         buttonBackgroundColor: Colors.blueAccent,
//         color: Colors.blueAccent,
//         animationDuration: Duration(milliseconds: 300),
//         items: const [
//           Icon(Icons.home, size: 26, color: Colors.white),
//           Icon(Icons.back_hand, size: 26, color: Colors.white),
//           Icon(Icons.request_page, size: 26, color: Colors.white),
//           Icon(Icons.handyman_outlined, size: 26, color: Colors.white),
//           Icon(Icons.notifications, size: 26, color: Colors.white),
//           Icon(Icons.message, size: 26, color: Colors.white),
//         ],
//         onTap: (index) {
//           switch (index) {
//             case 0:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => Warden(username: 'Warden')),
//               );
//               break;
//             case 1:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CheckAttendance()),
//               );
//               break;
//             case 2:
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => SeeRequests()),
//               // );
//               break;
//             case 3:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Complains()),
//               );
//               break;
//             case 4:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => Notifications(
//                           username: '',
//                         )),
//               );
//               break;
//             case 5:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Messages()),
//               );
//               break;
//           }
//         },
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   ChatMessage({required this.text, required this.animationController});
//   final String text;
//   final AnimationController animationController;

//   @override
//   Widget build(BuildContext context) {
//     return SizeTransition(
//       sizeFactor: CurvedAnimation(
//         parent: animationController,
//         curve: Curves.easeOut,
//       ),
//       axisAlignment: 0.0,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               margin: const EdgeInsets.only(right: 16.0),
//               child: CircleAvatar(
//                 child: Text('Me'),
//                 backgroundColor: Color.fromARGB(255, 21, 203, 67),
//                 foregroundColor: Color.fromARGB(255, 8, 0, 0),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Me',
//                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 237, 144, 5),
//                       ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 5.0),
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: BoxDecoration(
//                     color: Colors.blueAccent.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Text(
//                     text,
//                     style: TextStyle(color: Colors.black87, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hostel/Directmsg.dart';
import 'package:hostel/complains.dart';
import 'package:hostel/notice.dart';
import 'package:hostel/rooms.dart';
import 'package:hostel/warden.dart';
// import 'package:hostel_management_system/Directmsg.dart';
// import 'package:hostel_management_system/Notice.dart';
// import 'package:hostel_management_system/complains.dart';
// import 'package:hostel_management_system/rooms.dart';
// import 'package:hostel_management_system/warden.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Msgmenuu(),
    );
  }
}

class Msgmenuu extends StatefulWidget {
  const Msgmenuu({Key? key}) : super(key: key);

  @override
  State<Msgmenuu> createState() => _MsgmenuuState();
}

class _MsgmenuuState extends State<Msgmenuu> {
  List<Widget> _pages = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Set the height of the AppBar
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text(
            'Message Menu',
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
          Spacer(),
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // border radius
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notice()),
                  );
                  // button press action
                },
                child: Text(
                  'Notice',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // border radius
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Direct_Msg()),
                  );
                  // button press action
                },
                child: Text(
                  'Direct Message',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blueAccent,
        color: Colors.blueAccent,
        animationDuration: const Duration(milliseconds: 300),
        index: 3,
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
            //_page = index;
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
