import 'package:flutter/material.dart';
import 'login_page.dart'; // Pastikan path ini sesuai dengan struktur proyek Anda

class Step3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // Background gambar atau placeholder untuk Step 3
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'lib/assets/images/apply_job.png', // Ganti dengan path gambar untuk Step 3
                width: 303,
                height: 296,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Konten teks untuk Step 3
          Positioned(
            left: 16,
            right: 16,
            top: 480,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Judul untuk Step 3
                Text(
                  'Melamar magang terbaik',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16), // Spasi antara judul dan deskripsi

                // Deskripsi untuk Step 3
                Text(
                  'Pelajari strategi dan tips terbaik untuk menyusun lamaran magang yang membuat Anda berdiri di antara pelamar lainnya.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),

          // Tombol Skip dan Next untuk Step 3
          Positioned(
            left: 16,
            right: 16,
            bottom: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Aksi ketika tombol Skip ditekan pada Step 3
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
                    // Aksi ketika tombol Next ditekan pada Step 3
                    _navigateToLogin(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF0D9D57)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
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

  // Fungsi untuk navigasi ke halaman LoginPage
  void _navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
