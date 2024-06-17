import 'package:flutter/material.dart';
import 'categories_page.dart';  // Import the CategoriesPage

class InternshipPreferencesPage extends StatefulWidget {
  @override
  _InternshipPreferencesPageState createState() =>
      _InternshipPreferencesPageState();
}

class _InternshipPreferencesPageState extends State<InternshipPreferencesPage> {
  final List<String> companyTypes = [
    'Energi dan Pertambangan',
    'FMCG',
    'Otomotif',
    'Ritel',
    'Jasa Industrial',
    'Makanan dan Minuman',
    'Pertanian dan Perkebunan',
    'Media dan Informasi'
  ];

  final List<String> positionTypes = [
    'Work from Office',
    'Work from Home',
    'Hybrid'
  ];

  final List<String> fromTypes = [
    'Samarinda',
    'Bontang',
    'Berau',
    'Balikpapan',
    'Penajam Paser Utara',
    'Kutai Barat',
    'Paser',
    'Kutai Kartanegara',
    'Mahakam Ulu',
    'Kutai Timur'
  ];

  final List<String> timeTypes = [
    'Full-Time',
    'Part-Time',
    'Volunteer',
    'Kontrak'
  ];

  Set<String> selectedCompanyTypes = {};
  Set<String> selectedPositionTypes = {};
  Set<String> selectedFromTypes = {};
  Set<String> selectedTimeTypes = {};
  String? hoveredType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40, // Adjust height as needed
                    width: 40, // Adjust width as needed
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    'Internship Preferences',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D9D57),
                    ),
                  ),
                  SizedBox(width: 40), // To balance the alignment
                ],
              ),
              SizedBox(height: 20),
              _buildCategory(
                title: 'Tipe Perusahaan',
                items: companyTypes,
                selectedItems: selectedCompanyTypes,
                showSeeAll: true,
              ),
              SizedBox(height: 20),
              _buildCategory(
                title: 'Tipe Posisi',
                items: positionTypes,
                selectedItems: selectedPositionTypes,
                showSeeAll: false,
              ),
              SizedBox(height: 20),
              _buildCategory(
                title: 'Asal Perusahaan',
                items: fromTypes,
                selectedItems: selectedFromTypes,
                showSeeAll: false,
              ),
              SizedBox(height: 20),
              _buildCategory(
                title: 'Waktu Bekerja',
                items: timeTypes,
                selectedItems: selectedTimeTypes,
                showSeeAll: false,
              ),
              SizedBox(height: 35), // Space before the Next button
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF0D9D57),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Navigate to CategoriesPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesPage(),
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
      ),
    );
  }

  Widget _buildCategory({
    required String title,
    required List<String> items,
    required Set<String> selectedItems,
    required bool showSeeAll,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            if (showSeeAll)
              TextButton(
                onPressed: () {
                  // Navigate or perform action for "See All"
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
        Wrap(
          spacing: 6.0,
          runSpacing: 0,
          children: items.map((type) {
            final isSelected = selectedItems.contains(type);
            final isHovered = hoveredType == type;

            return MouseRegion(
              onEnter: (_) => setState(() => hoveredType = type),
              onExit: (_) => setState(() => hoveredType = null),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedItems.remove(type);
                    } else {
                      selectedItems.add(type);
                    }
                  });
                },
                child: Chip(
                  label: Text(type),
                  backgroundColor: isSelected || isHovered
                      ? Color(0xFF0D9D57)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: isHovered
                        ? BorderSide.none
                        : BorderSide(
                            color: Color(0xFF94A3B8),
                          ),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: isSelected || isHovered
                        ? Colors.white
                        : Color(0xFF94A3B8),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InternshipPreferencesPage(),
  ));
}
