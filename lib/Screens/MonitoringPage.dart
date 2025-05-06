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
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/Icons/Monitoring.png',
              width: 30,
              height: 30,
            ),
            SizedBox(width: 8),
            Text(
              'Monitoring',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Voltage Section
              _buildSectionHeader('Voltage'),
              _buildHorizontalCardList(
                cards: [
                  CustomCard(
                    imagePath: 'assets/Icons/Voltage.png',
                    title: 'Room 1',
                    data: '220 V',
                  ),
                  CustomCard(
                    imagePath: 'assets/Icons/Voltage.png',
                    title: 'Room 2',
                    data: '220 V',
                  ),
                  CustomCard(
                    imagePath: 'assets/Icons/Voltage.png',
                    title: 'Living Room',
                    data: '220 V',
                  ),
                ],
              ),

              // Temperature Section
              _buildSectionHeader('Temperature'),
              _buildHorizontalCardList(
                cards: [
                  CustomCard(
                    imagePath: 'assets/Icons/Temperature.png',
                    title: 'Room 1',
                    data: '24°C',
                  ),
                  CustomCard(
                    imagePath: 'assets/Icons/Temperature.png',
                    title: 'Room 2',
                    data: '23°C',
                  ),
                ],
              ),

              // Battery Status Section
              _buildSectionHeader('Battery Status'),
              _buildHorizontalCardList(
                cards: [
                  ChargingStatusCard(
                    chargingStatus: ChargingStatus(
                      title: 'Main Battery',
                      status: 'Charging',
                      percentage: 50,
                    ),
                  ),
                  ChargingStatusCard(
                    chargingStatus: ChargingStatus(
                      title: 'Solar Power Battery',
                      status: 'Charging',
                      percentage: 75,
                    ),
                  ),
                ],
              ),

              // Car Charging Section
              _buildSectionHeader('Car Charging'),
              _buildHorizontalCardList(
                cards: [
                  ChargingStatusCard(
                    chargingStatus: ChargingStatus(
                      title: 'Electric Car',
                      status: 'Charging',
                      percentage: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build the section header
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 10, 10, 10),
        ),
      ),
    );
  }

  // Helper function to build a horizontally scrollable row of cards
  Widget _buildHorizontalCardList({required List<Widget> cards}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cards,
      ),
    );
  }
}
