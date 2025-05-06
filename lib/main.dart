import 'package:energy_optimization_and_monitoring_app/Screens/Authetication%20Screens/auth_screen.dart';
import 'package:energy_optimization_and_monitoring_app/Screens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home Energy Monitoring And Optimizing App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snap) {
              if (snap.data == null) {
                return const AuthScreen();
              } else {
                return const Homepage();
              }
            }));
  }
}
