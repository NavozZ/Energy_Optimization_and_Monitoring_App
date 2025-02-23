// DashboardPage.dart
import 'package:energy_optimization_and_monitoring_app/Widgets/custom_card.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize
              .min, // Ensures the row takes only as much space as needed
          children: [
            Image.asset(
              'assets/Icons/Dasboard.png', // Use your custom icon
              width: 30, // Set your desired width for the icon
              height: 30, // Set your desired height for the icon
            ),
            SizedBox(width: 8), // Space between icon and text
            Text(
              'Dashboard',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CustomCard(
              imagePath:
                  'assets/Icons/Voltage.png', // Path to your custom image
              title: 'Overall System Voltage',
              data: '220 V',
            ),
            CustomCard(
              imagePath:
                  'assets/Icons/Temperature.png', // Path to your custom image
              title: 'System Temperature',
              data: '24°C',
            ),
            CustomCard(
              imagePath:
                  'assets/Icons/weather.png', // Path to your custom image
              title: 'Weather',
              data: 'Rainy',
            )
          ],
        ),
      ),
    );
  }
}
