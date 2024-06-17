import 'package:flutter/material.dart';
import 'step1_page.dart'; // Impor Step1Page yang telah Anda buat

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Gunakan Future.delayed untuk membuat jeda 2 detik setelah tampilan SplashScreen muncul
    Future.delayed(Duration(seconds: 2), () {
      // Navigasi ke Step1Page dengan efek transisi yang halus
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500), // Durasi transisi
          pageBuilder: (_, __, ___) => Step1Page(), // Halaman tujuan
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            // Animasi transisi menggunakan FadeTransition
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFF0D9D57), // Warna latar belakang dengan hexa 0D9D57
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Teks "CampusConnect" di tengah layar
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Teks "CampusConnect"
                  Text(
                    'CampusConnect',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Animasi loading di bagian bawah layar
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150.0), // Atur jarak dari bottom
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
