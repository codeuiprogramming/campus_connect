import 'package:flutter/material.dart';
import 'forgot_password_page.dart'; // Sesuaikan dengan lokasi ForgotPasswordPage
import 'step1_page.dart'; // Sesuaikan dengan lokasi Step1Page
import 'register_page.dart'; // Sesuaikan dengan lokasi RegisterPage
import 'type_internship_page.dart'; // Sesuaikan dengan lokasi TypeInternshipPage

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  bool _emailHasFocus = false;
  bool _passwordHasFocus = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateEmailFocus);
    _passwordController.addListener(_updatePasswordFocus);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateEmailFocus);
    _passwordController.removeListener(_updatePasswordFocus);
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _updateEmailFocus() {
    setState(() {
      _emailHasFocus = _emailController.text.isNotEmpty;
    });
  }

  void _updatePasswordFocus() {
    setState(() {
      _passwordHasFocus = _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Step1Page()),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                'CampusConnect',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D9D57),
                ),
              ),
              SizedBox(height: 0),
              Text(
                'Selamat Datang 👋',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 0),
              Text(
                'Silahkan masuk menggunakan email Anda',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF94A3B8),
                ),
              ),
              SizedBox(height: 40),
              // Form Email dan Password
              TextField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                cursorColor: Color(0xFF0D9D57),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: _emailHasFocus ? Color(0xFF0D9D57) : Color(0xFF94A3B8)),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: _emailHasFocus ? Color(0xFF0D9D57) : Color(0xFF94A3B8)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0D9D57)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF94A3B8)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                obscureText: _obscureText,
                cursorColor: Color(0xFF0D9D57),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: _passwordHasFocus ? Color(0xFF0D9D57) : Color(0xFF94A3B8)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: _passwordHasFocus ? Color(0xFF0D9D57) : Color(0xFF94A3B8),
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: _passwordHasFocus ? Color(0xFF0D9D57) : Color(0xFF94A3B8)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0D9D57)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF94A3B8)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordPage()), // Navigasi ke ForgotPasswordPage
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF0D9D57),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol Login ditekan
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TypeInternshipPage()), // Navigasi ke TypeInternshipPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D9D57),
                  padding: EdgeInsets.symmetric(horizontal: 155, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Color(0xFF94A3B8),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or continue with',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color(0xFF94A3B8),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _socialLoginButton('lib/assets/icons/facebook.png'),
                  _socialLoginButton('lib/assets/icons/google.png'),
                  _socialLoginButton('lib/assets/icons/apple.png'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF0D9D57),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialLoginButton(String assetPath) {
    return ElevatedButton(
      onPressed: () {
        // Aksi ketika tombol sosial login ditekan
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF94A3B8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(16),
      ),
      child: Image.asset(
        assetPath,
        height: 32,
        width: 32,
      ),
    );
  }
}
