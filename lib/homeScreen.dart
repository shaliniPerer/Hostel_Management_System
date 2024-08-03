import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hostelapp/login.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              "assets/image1.jpg",
              height: 400,
              width: 600,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "    WELCOME \n your new home",
                style: TextStyle(
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}




      //   Container(
      //     width: double.infinity,
      //     height: 55,
      //     margin: const EdgeInsets.all(20),
      //     child: ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //             backgroundColor: Colors.blueAccent, // Background color
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10))),
      //         // onPressed: () {
      //         //   Navigator.push(
      //         //       context,
      //         //       MaterialPageRoute(
      //         //           builder: (context) => login()));
      //         // },
      //         child: const Text(
      //           "LogIn",
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 18,
      //             color: Colors.white,
      //           ),
      //         )),
      //   )
      // ],



