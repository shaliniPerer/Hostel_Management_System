// import 'package:flutter/material.dart';
// import 'package:n_hostel/room_service.dart.dart';

// class AddBed extends StatefulWidget {
//   const AddBed({Key? key}) : super(key: key);

//   @override
//   _AddBedState createState() => _AddBedState();
// }

// class _AddBedState extends State<AddBed> {
//   final TextEditingController _roomIdController = TextEditingController();
//   final TextEditingController _bedTypeController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();
//   final RoomService _roomService = RoomService();

//   @override
//   void dispose() {
//     _roomIdController.dispose();
//     _bedTypeController.dispose();
//     _quantityController.dispose();
//     super.dispose();
//   }

//   void _addBed() {
//     String roomId = _roomIdController.text.trim();
//     String bedType = _bedTypeController.text.trim();
//     int quantity = int.tryParse(_quantityController.text.trim()) ?? 0;

//     if (roomId.isNotEmpty && bedType.isNotEmpty && quantity > 0) {
//       _roomService.addBed(roomId, bedType, quantity).then((_) {
//         Navigator.pop(context); // Navigate back after adding bed
//       });
//     } else {
//       // Handle validation or error cases
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Bed'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _roomIdController,
//               decoration: InputDecoration(labelText: 'Room ID'),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _bedTypeController,
//               decoration: InputDecoration(labelText: 'Bed Type'),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _quantityController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Quantity'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _addBed,
//               child: Text('Add Bed'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
