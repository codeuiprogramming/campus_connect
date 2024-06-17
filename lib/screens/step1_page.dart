import 'package:flutter/material.dart';
import 'step2_page.dart'; // Sesuaikan dengan lokasi Step2Page
import 'login_page.dart'; // Sesuaikan dengan lokasi LoginPage

class Step1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // Background gambar atau placeholder
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'lib/assets/images/search_jobs.png',
                width: 303,
                height: 296,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Konten teks
          Positioned(
            left: 16,
            right: 16,
            top: 480,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Judul
                Text(
                  'Temukan tempat magangmu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16), // Spasi antara judul dan deskripsi

                // Deskripsi
                Text(
                  'Cari tempat magang yang cocok dengan bakat dan keterampilan Anda untuk memperluas pengalaman dan membangun karier yang solid.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),

          // Tombol Skip dan Next
          Positioned(
            left: 16,
            right: 16,
            bottom: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    _skipToNext(context); // Panggil fungsi untuk skip
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _navigateToStep2(context); // Panggil fungsi navigasi
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF0D9D57)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 12)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk navigasi ke halaman Step2Page
  void _navigateToStep2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Step2Page(), // Ganti dengan halaman yang sesuai
      ),
    );
  }

  // Fungsi untuk aksi skip
  void _skipToNext(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(), // Ganti dengan halaman LoginPage
      ),
    );
  }
}
