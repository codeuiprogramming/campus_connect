import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Impor SplashScreen yang telah Anda buat


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Tampilkan SplashScreen pertama kali
    );
  }
}
