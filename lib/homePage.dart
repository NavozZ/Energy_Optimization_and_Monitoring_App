import 'package:energy_optimization_and_monitoring_app/ControlingPage.dart';
import 'package:energy_optimization_and_monitoring_app/DashboardPage.dart';
import 'package:energy_optimization_and_monitoring_app/MonitoringPage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: 50, // Set the width of the side panel
            color: const Color.fromARGB(255, 80, 142, 173),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Divider(
                    color: Colors.white,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Icon(Icons.ac_unit, color: Colors.white),
                  ), // Example logo
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Divider(
                    color: Colors.white,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Menu",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: IconButton(
                          icon: Icon(Icons.dashboard, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardPage()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: IconButton(
                          icon: Icon(Icons.monitor, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Monitoringpage()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: IconButton(
                          icon: Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Controlingpage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                  'Select an option from the side panel'), // Placeholder text
            ),
          ),
        ],
      ),
    );
  }
}
