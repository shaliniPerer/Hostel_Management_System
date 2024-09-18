import 'package:flutter/material.dart';
import 'package:untitled1/navigation.dart';
import 'package:untitled1/wrequest.dart';
import 'package:untitled1/wroom.dart';
import 'package:untitled1/wattendence.dart';
import 'package:untitled1/wcomplain.dart';
import 'package:untitled1/wnotification.dart';
import 'package:untitled1/wmessage.dart';


class warden extends StatefulWidget {
  final String username;
  const warden({Key? key, required this.username}) : super(key: key);

  @override
  State<warden> createState() => _wardenState();
}

class _wardenState extends State<warden> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(username: widget.username),
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    'WELCOME!!',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                        color: Colors.black),
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
                  itemDashboard(
                    '     Room \n Availability',
                    Icons.room,
                    Colors.deepOrange,
                        () {
                      print("Hiiiiiiiii");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => wroom()),
                      );
                    },
                  ),
                  itemDashboard(
                    '       Mark \n Attendence',
                    Icons.grade,
                    Colors.green,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => wattendence()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Requests',
                    Icons.request_page,
                    Colors.blue,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => wrequest()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Complains',
                    Icons.report_problem,
                    Colors.red,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => wcomplain()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Notifications',
                    Icons.notifications,
                    Colors.purple,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => wnotification()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Messages',
                    Icons.message,
                    Colors.teal,
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => wmessage()),
                      );
                    },
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

  Widget itemDashboard(String title, IconData iconData, Color background, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme
                        .of(context)
                        .primaryColor
                        .withOpacity(.2),
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium)
            ],
          ),
        ),
      );
}
