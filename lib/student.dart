import 'package:flutter/material.dart';
import 'package:untitled1/sRoom.dart';
import 'package:untitled1/sMark.dart';
import 'package:untitled1/sRequest.dart'; // Import the new pages
import 'package:untitled1/sComplain.dart';
import 'package:untitled1/sNotifications.dart';
import 'package:untitled1/sMessage.dart';

class Student extends StatelessWidget {
  final String username;
  const Student({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(username: username),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String username;
  const MyHomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hello ${widget.username} !',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    'WELCOME!!',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.JPG'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Navigating to Room Availability');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sRoom()),
                      );
                    },
                    child: itemDashboard(
                        '     Room \n Availability',
                        Icons.room,
                        Colors.deepOrange),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const sMark()),
                      );
                    },
                    child: itemDashboard(
                        '     Mark \n Attendance',
                        Icons.back_hand,
                        Colors.green),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sRequest()),
                      );
                    },
                    child: itemDashboard(' Make a \n Request', Icons.request_page,
                        Colors.purple),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sComplain()),
                      );
                    },
                    child: itemDashboard('Complain', Icons.handyman_outlined,
                        Colors.brown),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sNotifications()),
                      );
                    },
                    child: itemDashboard('Notifications', Icons.notifications,
                        Colors.indigo),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sMessage()),
                      );
                    },
                    child: itemDashboard('Message', Icons.message, Colors.teal),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white)),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );
}
