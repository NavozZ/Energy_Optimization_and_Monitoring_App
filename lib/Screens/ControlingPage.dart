import 'package:flutter/material.dart';

class Controlingpage extends StatefulWidget {
  @override
  _ControlingpageState createState() => _ControlingpageState();
}

class _ControlingpageState extends State<Controlingpage> {
  // Example state for lights, doors, gates, and garage doors
  List<bool> lightsState =
      List.generate(8, (_) => false); // Initially all lights are off
  List<bool> doorsState =
      List.generate(2, (_) => false); // Initially all doors are locked
  List<bool> gatesState =
      List.generate(2, (_) => false); // Initially all gates are closed
  List<bool> garageDoorsState =
      List.generate(1, (_) => false); // Initially the garage door is closed

  // Method to toggle the state of lights, doors, gates, or garage doors
  void toggleSwitch(int index, String type) {
    setState(() {
      if (type == 'light') {
        lightsState[index] = !lightsState[index];
      } else if (type == 'door') {
        doorsState[index] = !doorsState[index];
      } else if (type == 'gate') {
        gatesState[index] = !gatesState[index];
      } else if (type == 'garage') {
        garageDoorsState[index] = !garageDoorsState[index];
      }
    });

    // Here you can add IoT integration, for example, sending the state to your IoT device.
    // Example: sendIoTCommand(type, index, state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisSize: MainAxisSize
              .min, // Ensures the row takes only as much space as needed
          children: [
            Image.asset(
              'assets/Icons/ControlPanel.png', // Use your custom icon
              width: 30, // Set your desired width for the icon
              height: 30, // Set your desired height for the icon
            ),
            SizedBox(width: 8), // Space between icon and text
            Text(
              'Control Panel',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lights Section
              Text(
                'Lights Control',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: List.generate(2, (index) {
                  return ListTile(
                    title: Text('Light ${index + 1}'),
                    trailing: Switch(
                      activeColor: const Color.fromARGB(255, 236, 238, 236),
                      inactiveThumbColor:
                          const Color.fromARGB(255, 238, 233, 233),
                      inactiveTrackColor:
                          const Color.fromARGB(255, 128, 123, 123),
                      activeTrackColor: const Color.fromARGB(255, 6, 218, 76),
                      value: lightsState[index],
                      onChanged: (value) {
                        toggleSwitch(index, 'light');
                      },
                    ),
                  );
                }),
              ),

              // Gates Section
              SizedBox(height: 20),
              Text(
                'Gates Control',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: List.generate(2, (index) {
                  return ListTile(
                    title: Text('Gate ${index + 1}'),
                    trailing: Switch(
                      activeColor: const Color.fromARGB(255, 236, 238, 236),
                      inactiveThumbColor:
                          const Color.fromARGB(255, 238, 233, 233),
                      inactiveTrackColor:
                          const Color.fromARGB(255, 128, 123, 123),
                      activeTrackColor: const Color.fromARGB(255, 6, 218, 76),
                      value: gatesState[index],
                      onChanged: (value) {
                        toggleSwitch(index, 'gate');
                      },
                    ),
                  );
                }),
              ),

              // Garage Door Section
              SizedBox(height: 20),
              Text(
                'Garage Door Control',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: List.generate(1, (index) {
                  return ListTile(
                    title: Text('Garage Door ${index + 1}'),
                    trailing: Switch(
                      activeColor: const Color.fromARGB(255, 236, 238, 236),
                      inactiveThumbColor:
                          const Color.fromARGB(255, 238, 233, 233),
                      inactiveTrackColor:
                          const Color.fromARGB(255, 128, 123, 123),
                      activeTrackColor: const Color.fromARGB(255, 6, 218, 76),
                      value: garageDoorsState[index],
                      onChanged: (value) {
                        toggleSwitch(index, 'garage');
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
