import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan untuk mengimpor home_page.dart

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D9D57),
                  ),
                ),
                SizedBox(width: 40), // Untuk menyeimbangkan penempatan
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Company',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Implementasi logika untuk "See All" jika diperlukan
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom per baris
                  childAspectRatio: 1.0, // Rasio aspek 1:1 (persegi)
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 8, // Jumlah item perusahaan
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Tambahkan logika jika diperlukan
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white, // Warna default
                        border: Border.all(
                          color: Color(0xFF94A3B8), // Warna garis
                          width: 1, // Lebar garis
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80, // Lebar gambar
                            height: 80, // Tinggi gambar
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey, // Warna latar belakang abu-abu
                              border: Border.all(
                                color: Color(0xFF94A3B8), // Warna garis
                                width: 4, // Lebar garis
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'lib/assets/images/company${index + 1}.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'PT. Company ${index + 1}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 35), // Spasi sebelum tombol "Next"
            Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFF0D9D57),
                ),
                child: TextButton(
                  onPressed: () {
                    // Navigasi ke halaman utama (HomePage)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(username: 'example_username'),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.transparent,
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    // Definisi rute untuk aplikasi
    routes: {
      '/': (context) => CategoriesPage(), // Rute untuk CategoriesPage
      '/home': (context) => HomePage(username: 'example_username'),   // Rute untuk HomePage dengan username
    },
  ));
}
