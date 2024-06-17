import 'package:flutter/material.dart';
import 'internship_preferences_page.dart'; // Import halaman InternshipPreferencesPage

class TypeInternship2Page extends StatefulWidget {
  @override
  _TypeInternship2PageState createState() => _TypeInternship2PageState();
}

class _TypeInternship2PageState extends State<TypeInternship2Page> {
  Set<String> selectedInternships = Set<String>();

final List<Map<String, dynamic>> internships = [
  {'name': 'Full-Time', 'icon': Icons.work}, // Full-Time - Work Icon
  {'name': 'Part-Time', 'icon': Icons.access_time}, // Part-Time - Access Time Icon
  {'name': 'Shift-Time', 'icon': Icons.schedule}, // Shift-Time - Schedule Icon
  {'name': 'Flexible-Time', 'icon': Icons.timer}, // Flexible-Time - Timer Icon
  {'name': 'Freelance', 'icon': Icons.laptop_mac}, // Freelance - Laptop Mac Icon
  {'name': 'Fixed Working Hours', 'icon': Icons.watch_later}, // Fixed Working Hours - Watch Later Icon
];


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
                            selectedInternships.remove(internship['name']);
                          } else {
                            selectedInternships.add(internship['name']);
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
                  // Navigasi ke halaman InternshipPreferencesPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InternshipPreferencesPage()), // Sesuaikan dengan navigasi ke InternshipPreferencesPage
                  );
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
