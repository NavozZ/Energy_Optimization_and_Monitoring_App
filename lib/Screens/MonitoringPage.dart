import 'package:energy_optimization_and_monitoring_app/Widgets/ChargingCard.dart';
import 'package:energy_optimization_and_monitoring_app/Widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Monitoringpage extends StatelessWidget {
  const Monitoringpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize
              .min, // Ensures the row takes only as much space as needed
          children: [
            Image.asset(
              'assets/Icons/Monitoring.png', // Use your custom icon
              width: 30, // Set your desired width for the icon
              height: 30, // Set your desired height for the icon
            ),
            SizedBox(width: 8), // Space between icon and text
            Text(
              'Monitoring',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Voltage',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 10, 10, 10),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomCard(
                  imagePath:
                      'assets/Icons/Voltage.png', // Path to your custom image
                  title: 'Room 1',
                  data: '220 V',
                ),
                CustomCard(
                  imagePath:
                      'assets/Icons/Voltage.png', // Path to your custom image
                  title: 'Room 2',
                  data: '220 V',
                ),
                CustomCard(
                  imagePath:
                      'assets/Icons/Voltage.png', // Path to your custom image
                  title: 'Living Room',
                  data: '220 V',
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Temperature',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 10, 10, 10),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomCard(
                  imagePath:
                      'assets/Icons/Temperature.png', // Path to your custom image
                  title: 'Room 1',
                  data: '24°C',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Battery Status',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 10, 10, 10),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ChargingStatusCard(
                  chargingStatus: ChargingStatus(
                    title: 'Tesla Model S',
                    status: 'Charging',
                    percentage: 75,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
