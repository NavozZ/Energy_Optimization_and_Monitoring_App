import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart'; // ✅ NEW
import '../services/firebase_services.dart';

class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  bool garageDoorOpen = false;
  final garageDoc =
      FirebaseFirestore.instance.collection('settings').doc('garageDoor');

  @override
  void initState() {
    super.initState();

    // 🔁 Listen for real-time updates from Firestore
    garageDoc.snapshots().listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null && data.containsKey('state')) {
          final state = data['state'] as String;
          setState(() {
            garageDoorOpen = (state == 'open');
          });
        }
      }
    });
  }

  void toggleGarageDoor() async {
    final newState = garageDoorOpen ? 'closed' : 'open';

    try {
      // ✅ Update Firestore
      await FirebaseServices.updateGarageDoorState(newState);

      // ✅ Also update Realtime Database (ESP32 reads this)
      final dbRef = FirebaseDatabase.instance.ref();
      await dbRef.child('garageDoor/state').set(newState);
    } catch (e) {
      print('Failed to update garage door state: $e');
      // Optionally show an error message to the user
    }
    // UI will auto-update from Firestore listener
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garage Door Control'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: toggleGarageDoor,
          child:
              Text(garageDoorOpen ? 'Close Garage Door' : 'Open Garage Door'),
        ),
      ),
    );
  }
}
