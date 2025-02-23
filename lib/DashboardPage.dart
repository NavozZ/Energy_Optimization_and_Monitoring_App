// DashboardPage.dart
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
            Icon(Icons.star,
                color: const Color.fromARGB(255, 27, 26, 26)), // Example icon
            SizedBox(width: 8), // Space between icon and text
            Text('Dashboard'),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}
