import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  final List<Map<String, dynamic>> companies = [
    {
      'name': 'PT. Laktat Nusantara',
      'logo': 'lib/assets/images/company1.png',
      'location': 'Kutai Kartanegara, Indonesia',
      'position': 'Internship Kotlin',
      'accredited': true,
      'specialties': ['Full-time', 'Informatika dan Media', 'WFH', '100 orang'],
    },
    {
      'name': 'PT. Ascorbic Jaya',
      'logo': 'lib/assets/images/company2.png',
      'location': 'Bandung, Indonesia',
      'position': 'Internship Flutter',
      'accredited': false,
      'specialties': ['Part-time', 'Mobile Development', '50 orang'],
    },
    {
      'name': 'PT. Flavour Beta',
      'logo': 'lib/assets/images/company3.png',
      'location': 'Surabaya, Indonesia',
      'position': 'Internship React Native',
      'accredited': true,
      'specialties': ['Full-time', 'Web Development', '75 orang'],
    },
  ];

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '👋',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/assets/images/avatar.png'),
                  backgroundColor: Colors.grey.shade300,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF94A3B8).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xFF94A3B8),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Cari Lowongan Magang',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFF94A3B8).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.filter_list,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rekomendasi Perusahaan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate or perform action for "Lihat Semua"
                  },
                  child: Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF0D9D57),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 270, // Sesuaikan tinggi maksimum sesuai kebutuhan
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: companies.length,
                itemBuilder: (context, index) {
                  final company = companies[index];
                  Color cardColor;
                  if (index == 0) {
                    cardColor = Color(0xFF0D9D57); // Green
                  } else if (index == 1) {
                    cardColor = Color(0xFF634CB8); // Purple
                  } else {
                    cardColor = Color(0xFF5884E4); // Blue
                  }
                  return CompanyCard(
                    company: company,
                    backgroundColor: cardColor,
                    onTap: () {
                      // Handle tap action (navigate to detail page, etc.)
                      print('Tapped on ${company['name']}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  final Map<String, dynamic> company;
  final Color backgroundColor;
  final VoidCallback? onTap;

  CompanyCard({
    required this.company,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 293,
        height: 270, // Tinggi card disesuaikan dengan konten
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    company['logo'],
                    width: 56,
                    height: 56,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              company['position'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              // Handle bookmark action
                              print('Bookmark ${company['name']}');
                            },
                            child: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                      Row(
                        children: [
                          Icon(
                            Icons.verified,
                            color: Colors.green,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                company['name'],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                company['location'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        alignment: WrapAlignment.start, // Geser ke kiri
                        spacing: 4.0, // Jarak horizontal antar Chip
                        runSpacing: 4.0, // Jarak vertikal antar Chip
                        children: [
                          for (String specialty in company['specialties'])
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                specialty,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                          onPressed: () {
                            // Handle "Lihat Lowongan" action
                            print('Lihat Lowongan for ${company['name']}');
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Lihat Lowongan',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(
      username: 'Nama Pengguna', // Ganti dengan username sesungguhnya
    ),
  ));
}