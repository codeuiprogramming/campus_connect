import 'package:flutter/material.dart';
import 'type_internship2_page.dart'; // Import halaman TypeInternship2Page

class TypeInternshipPage extends StatefulWidget {
  @override
  _TypeInternshipPageState createState() => _TypeInternshipPageState();
}

class _TypeInternshipPageState extends State<TypeInternshipPage> {
  Set<String> selectedInternships = Set<String>();

  final List<Map<String, dynamic>> internships = [
    {'name': 'IT dan Teknisi', 'icon': Icons.computer},
    {'name': 'Hotel dan Restoran', 'icon': Icons.restaurant},
    {'name': 'Akuntansi dan Keuangan', 'icon': Icons.account_balance_wallet},
    {'name': 'Penjualan', 'icon': Icons.shopping_cart},
    {'name': 'Tenaga Administrasi', 'icon': Icons.admin_panel_settings},
    {'name': 'Kesehatan', 'icon': Icons.health_and_safety},
    {'name': 'Salon dan Kecantikan', 'icon': Icons.face_retouching_natural},
  ];

  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TypeInternship2Page()), // Navigasi ke halaman TypeInternship2Page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 100, // Adjust the height to provide space above the close icon
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          // Navigasi ke halaman beranda
                          Navigator.pop(context); // Sesuaikan dengan navigasi ke beranda
                        },
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 0), // Adjust this height for more space above CampusConnect
                        Text(
                          'CampusConnect',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D9D57),
                          ),
                        ),
                        SizedBox(height: 0), // Adjust this height for more space below CampusConnect
                      ],
                    ),
                    SizedBox(width: 48), // To balance the alignment
                  ],
                ),
                SizedBox(height: 0), // Adjusted height
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What type of internship are you interested in?',
                    style: TextStyle(
                      fontSize: 20, // Reduced font size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  children: internships.map((internship) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedInternships.contains(internship['name'])) {
                            selectedInternships.remove(internship['name']); // Deselect
                          } else {
                            selectedInternships.add(internship['name']); // Select
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 6.0),
                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0), // Reduced padding
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 2,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(internship['icon'], color: Color(0xFF0D9D57)),
                                SizedBox(width: 10),
                                Text(
                                  internship['name'],
                                  style: TextStyle(fontSize: 16), // Reduced font size
                                ),
                              ],
                            ),
                            if (selectedInternships.contains(internship['name']))
                              Icon(Icons.check_circle, color: Color(0xFF0D9D57))
                            else
                              Icon(Icons.circle_outlined, color: Colors.grey),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedInternships.isNotEmpty) {
                    // Jika ada jurusan yang dipilih, navigasi ke halaman TypeInternship2Page
                    _navigateToNextPage();
                  } else {
                    // Tampilkan pesan bahwa pengguna harus memilih setidaknya satu jurusan
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Please Select an Internship Type'),
                          content: Text('You need to select at least one internship type to proceed.'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D9D57),
                  padding: EdgeInsets.symmetric(horizontal: 163, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
