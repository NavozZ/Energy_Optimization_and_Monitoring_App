import 'package:flutter/material.dart';

class ChargingStatus {
  final String title;
  final String status; // Charging, Charged, Not Connected
  final int percentage;

  ChargingStatus(
      {required this.title, required this.status, required this.percentage});
}

class ChargingStatusCard extends StatelessWidget {
  final ChargingStatus chargingStatus;
  final String imagePath;

  const ChargingStatusCard({
    Key? key,
    required this.chargingStatus,
    this.imagePath = 'assets/Icons/batterycharging.gif',
  }) : super(key: key);

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
                  Image.asset(
                    imagePath,
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          chargingStatus.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          '${chargingStatus.status} - ${chargingStatus.percentage}%',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
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
              child: LinearProgressIndicator(
                value: chargingStatus.percentage / 100.0,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
