import 'package:energy_optimization_and_monitoring_app/Screens/ControlingPage.dart';
import 'package:energy_optimization_and_monitoring_app/Screens/DashboardPage.dart';
import 'package:energy_optimization_and_monitoring_app/Screens/MonitoringPage.dart';
import 'package:energy_optimization_and_monitoring_app/Screens/UserProfilePage.dart'; // Add your Profile page
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Track the selected index for Bottom Navigation Bar
  int _selectedIndex = 0;
  String _userName = ''; // To store the logged-in user's name

  // List of screens corresponding to each tab
  final List<Widget> _screens = [
    DashboardPage(),
    Monitoringpage(),
    Controlingpage(),
  ];

  // Create a GlobalKey for the Scaffold to open the Drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Handle Bottom Navigation Bar tab change
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Change the selected screen
    });
  }

  // Sign-out method
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(
        context, '/login'); // Redirect to the login screen after logout
  }

  // Fetch the logged-in user's name from Firestore
  Future<void> _fetchUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _userName =
            userDoc['name'] ?? 'No name'; // Retrieve user's name from Firestore
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserProfile(); // Fetch the user profile when the app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to the Scaffold
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Smart Home App',
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState
                ?.openDrawer(); // Open the drawer using the scaffoldKey
          },
        ),
      ),
      body: _screens[_selectedIndex], // Show the corresponding screen
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header (can include a profile picture and user name)
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/Icons/icons8-user-48.png'), // Add user profile image
                  ),
                  SizedBox(height: 10),
                  Text(
                    _userName, // Display the logged-in user's name
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            // Profile Button
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen()), // Navigate to user profile page
                );
              },
            ),
            // Logout Button
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                _signOut(); // Call sign-out method
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Update the selected screen
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor),
            label: 'Monitoring',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_camera),
            label: 'Control Panel',
          ),
        ],
      ),
    );
  }
}
