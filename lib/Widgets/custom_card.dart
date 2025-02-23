// DashboardPage.dart

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String title;
  final String data;

  const CustomCard({
    Key? key,
    this.icon,
    this.imagePath,
    required this.title,
    required this.data,
  })  : assert(icon != null || imagePath != null,
            'An icon or an image path must be provided.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Apply rounded corners
      ),
      child: Container(
        width: 240, // Define a fixed width for each card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  // Conditionally display an image or icon
                  if (imagePath != null)
                    Image.asset(
                      imagePath!,
                      width: 30,
                      height: 30,
                    )
                  else if (icon != null)
                    Icon(icon, color: Colors.white, size: 24),
                  SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                data,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
