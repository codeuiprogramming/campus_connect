import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'verify_code_page.dart'; // Import the VerifyCodePage

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  int _selectedIndex = 0; // Indeks untuk ToggleButtons

  bool _isEmailFieldHovered = false;
  bool _isPhoneFieldHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'CampusConnect',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D9D57),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Pilih metode untuk dapat mereset password dan tunggu kode OTP yang dikirimkan',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF94A3B8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedIndex == 0
                                ? Color(0xFF0D9D57)
                                : Colors.grey[300],
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              color: _selectedIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedIndex == 1
                                ? Color(0xFF0D9D57)
                                : Colors.grey[300],
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Phone',
                            style: TextStyle(
                              color: _selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _selectedIndex == 0
                      ? TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Color(0xFF0D9D57),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: _isEmailFieldHovered
                                  ? Color(0xFF0D9D57)
                                  : Color(0xFF94A3B8),
                            ),
                            prefixIcon:
                                Icon(Icons.email, color: Color(0xFF94A3B8)),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF0D9D57)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _isEmailFieldHovered = value.isNotEmpty;
                            });
                          },
                        )
                      : Container(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              IntlPhoneField(
                                controller: _phoneNumberController,
                                decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(
                                    color: _isPhoneFieldHovered
                                        ? Color(0xFF0D9D57)
                                        : Color(0xFF94A3B8),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF94A3B8)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF0D9D57)),
                                  ),
                                ),
                                initialCountryCode: 'ID',
                                onChanged: (phone) {
                                  setState(() {
                                    _isPhoneFieldHovered = phone
                                        .completeNumber.isNotEmpty;
                                  });
                                  print(phone.completeNumber);
                                },
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Action when Resend Code button is pressed
                  if (_selectedIndex == 0 && _emailController.text.isNotEmpty) {
                    // Send OTP to email
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyCodePage(
                          contactInfo: _emailController.text,
                          isEmail: true,
                        ),
                      ),
                    );
                  } else if (_selectedIndex == 1 &&
                      _phoneNumberController.text.isNotEmpty) {
                    // Send OTP to phone
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyCodePage(
                          contactInfo: _phoneNumberController.text,
                          isEmail: false,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D9D57),
                  padding: EdgeInsets.symmetric(horizontal: 132, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Resend Code',
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

