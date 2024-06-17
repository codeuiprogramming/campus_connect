import 'package:flutter/material.dart';
import 'reset_password_page.dart'; // Import halaman ResetPasswordPage

class VerifyCodePage extends StatefulWidget {
  final String contactInfo;
  final bool isEmail;

  VerifyCodePage({required this.contactInfo, required this.isEmail});

  @override
  _VerifyCodePageState createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  void _submitOTP() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    // Perform OTP verification logic here
    print('Entered OTP: $otp');

    // Check if OTP verification is successful (for demo purposes, assuming it's successful)
    bool isOtpVerified = true;

    if (isOtpVerified) {
      // Navigate to ResetPasswordPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordPage(),
        ),
      );
    } else {
      // Handle case when OTP verification fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Verification Failed'),
          content: Text('The OTP entered is incorrect. Please try again.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        ),
      );
    }
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
                        'Verify Code',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Masukkan kode OTP yang telah dikirim ke ${widget.isEmail ? 'email' : 'nomor telepon'}: ${widget.contactInfo}',
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
                  children: List.generate(4, (index) {
                    return Container(
                      width: 50,
                      height: 50, // Menambahkan tinggi agar terlihat kotak
                      child: TextField(
                        controller: _otpControllers[index],
                        focusNode: _focusNodes[index],
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24, // Ukuran font diperbesar
                          fontWeight: FontWeight.bold, // Font ditebalkan
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8), // Padding vertikal
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Color(0xFF94A3B8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Color(0xFF0D9D57)),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.length == 1 && index != 3) {
                            _focusNodes[index + 1].requestFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: _submitOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D9D57),
                  padding: EdgeInsets.symmetric(horizontal: 132, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Verify',
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
