import 'package:flutter/material.dart';

class sMark extends StatefulWidget {
  const sMark({super.key});

  @override
  State<sMark> createState() => _sMarkState();
}

class _sMarkState extends State<sMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // Set the height of the AppBar
          child: AppBar(
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
            title: Text(
              'Mark Attendence',
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ScanQRcode()));
                  });
                },
                child: Text('Scan QR Code')),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GenerateQRcode()));
                  });
                },
                child: Text('Generate QR Code')),
          ],
        )));
  }
}

class GenerateQRcode extends StatefulWidget {
  const GenerateQRcode({super.key});

  @override
  State<GenerateQRcode> createState() => _GenerateQRcodeState();
}

class _GenerateQRcodeState extends State<GenerateQRcode> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ScanQRcode extends StatefulWidget {
  const ScanQRcode({super.key});

  @override
  State<ScanQRcode> createState() => _ScanQRcodeState();
}

class _ScanQRcodeState extends State<ScanQRcode> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
