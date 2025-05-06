import 'package:flutter/material.dart';
import 'package:energy_optimization_and_monitoring_app/Widgets/custom_card.dart';

class DashboardPage extends StatelessWidget {
  // Sample data - This can be replaced with dynamic data from API or Firebase
  final Map<String, String> data = {
    'Voltage': '220 V',
    'Temperature': '24°C',
    'Weather': 'Rainy',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/Icons/Dasboard.png',
              width: 30,
              height: 30,
            ),
            SizedBox(width: 8),
            Text(
              'Dashboard',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Wrap the cards in a GridView for responsive design
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns for responsive design
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  String title = data.keys.elementAt(index);
                  String value = data.values.elementAt(index);
                  String imagePath = _getImagePathForTitle(title);
                  return CustomCard(
                    imagePath: imagePath,
                    title: title,
                    data: value,
                  );
                },
              ),
              // Add some additional smart data visualization if needed (e.g., charts)
              SizedBox(height: 20),
              _buildTemperatureChart(), // This is just an example for dynamic data visualization
            ],
          ),
        ),
      ),
    );
  }

  // Dynamically choose image based on the data type
  String _getImagePathForTitle(String title) {
    switch (title) {
      case 'Voltage':
        return 'assets/Icons/Voltage.png';
      case 'Temperature':
        return 'assets/Icons/Temperature.png';
      case 'Weather':
        return 'assets/Icons/weather.png';
      default:
        return 'assets/Icons/default.png'; // Fallback image
    }
  }

  // Example of dynamic data visualization (e.g., charts, progress bars, etc.)
  Widget _buildTemperatureChart() {
    // This could be a dynamic chart or a progress indicator
    return Container(
      height: 200,
      color: Colors.blue[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'System Temperature Over Time',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: 0.8, // Example value (can be dynamic)
            backgroundColor: Colors.grey[300],
            color: Colors.blue,
          ),
          SizedBox(height: 20),
          Text(
            'Current Temperature: 24°C',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
