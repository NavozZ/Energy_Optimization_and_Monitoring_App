import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../services/mqtt_service.dart'; // Create this service separately

class Controlingpage extends StatefulWidget {
  @override
  _ControlingpageState createState() => _ControlingpageState();
}

class _ControlingpageState extends State<Controlingpage> {
  final mqtt = MQTTService();

  List<bool> lightsState = List.generate(8, (_) => false);
  List<bool> doorsState = List.generate(2, (_) => false);
  List<bool> gatesState = List.generate(2, (_) => false);
  List<bool> garageDoorsState = List.generate(1, (_) => false);

  @override
  void initState() {
    super.initState();
    setupMQTT();
  }

  Future<void> setupMQTT() async {
    await mqtt.connect();

    mqtt.updates?.listen((List<MqttReceivedMessage<MqttMessage>>? messages) {
      final recMess = messages![0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      final topic = messages[0].topic;

      print('Received: $topic → $payload');

      // Handle incoming messages (optional – can update state based on ESP32 feedback)
    });
  }

  void toggleSwitch(int index, String type) {
    setState(() {
      if (type == 'light') {
        lightsState[index] = !lightsState[index];
        mqtt.publish("esp32/lights/$index", lightsState[index] ? "ON" : "OFF");
      } else if (type == 'door') {
        doorsState[index] = !doorsState[index];
        mqtt.publish(
            "esp32/doors/$index", doorsState[index] ? "OPEN" : "CLOSED");
      } else if (type == 'gate') {
        gatesState[index] = !gatesState[index];
        mqtt.publish(
            "esp32/gates/$index", gatesState[index] ? "OPEN" : "CLOSED");
      } else if (type == 'garage') {
        garageDoorsState[index] = !garageDoorsState[index];
        mqtt.publish(
            "esp32/garage/$index", garageDoorsState[index] ? "OPEN" : "CLOSED");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/Icons/ControlPanel.png',
              width: 30,
              height: 30,
            ),
            SizedBox(width: 8),
            Text(
              'Control Panel',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection('Lights Control', lightsState, 'light', 2),
            buildSection('Gates Control', gatesState, 'gate', 2),
            buildSection('Garage Door Control', garageDoorsState, 'garage', 1),
          ],
        ),
      ),
    );
  }

  Widget buildSection(
      String title, List<bool> stateList, String type, int itemCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Column(
          children: List.generate(itemCount, (index) {
            return ListTile(
              title: Text('$type ${index + 1}'.replaceFirst(
                  type, type[0].toUpperCase() + type.substring(1))),
              trailing: Switch(
                activeColor: const Color.fromARGB(255, 236, 238, 236),
                inactiveThumbColor: const Color.fromARGB(255, 238, 233, 233),
                inactiveTrackColor: const Color.fromARGB(255, 128, 123, 123),
                activeTrackColor: const Color.fromARGB(255, 6, 218, 76),
                value: stateList[index],
                onChanged: (value) {
                  toggleSwitch(index, type);
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}
