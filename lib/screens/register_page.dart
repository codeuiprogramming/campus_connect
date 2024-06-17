import 'package:flutter/material.dart';
import 'login_page.dart'; // Sesuaikan dengan lokasi LoginPage

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();
  bool _usernameHasFocus = false;
  bool _emailHasFocus = false;
  bool _passwordHasFocus = false;
  bool _confirmPasswordHasFocus = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateUsernameFocus);
    _emailController.addListener(_updateEmailFocus);
    _passwordController.addListener(_updatePasswordFocus);
    _confirmPasswordController.addListener(_updateConfirmPasswordFocus);
  }

  @override
  void dispose() {
    _usernameController.removeListener(_updateUsernameFocus);
    _emailController.removeListener(_updateEmailFocus);
    _passwordController.removeListener(_updatePasswordFocus);
    _confirmPasswordController.removeListener(_updateConfirmPasswordFocus);
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _updateUsernameFocus() {
    setState(() {
      _usernameHasFocus = _usernameController.text.isNotEmpty;
    });
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

  void _updateConfirmPasswordFocus() {
    setState(() {
      _confirmPasswordHasFocus = _confirmPasswordController.text.isNotEmpty;
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
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
                'Silahkan daftar menggunakan detail Anda',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF94A3B8),
                ),
              ),
              SizedBox(height: 40),
              // Form Username, Email, Password, dan Confirm Password
              TextField(
                controller: _usernameController,
                focusNode: _usernameFocusNode,
                cursorColor: Color(0xFF0D9D57),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,
                      color: _usernameHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8)),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: _usernameHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8)),
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
                controller: _emailController,
                focusNode: _emailFocusNode,
                cursorColor: Color(0xFF0D9D57),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email,
                      color: _emailHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8)),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: _emailHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8)),
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
                obscureText: _obscurePassword,
                cursorColor: Color(0xFF0D9D57),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,
                      color: _passwordHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: _passwordHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8),
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: _passwordHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8)),
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
                controller: _confirmPasswordController,
                focusNode: _confirmPasswordFocusNode,
                obscureText: _obscureConfirmPassword,
                cursorColor: Color(0xFF0D9D57),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,
                      color: _confirmPasswordHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: _confirmPasswordHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8),
                    ),
                    onPressed: _toggleConfirmPasswordVisibility,
                  ),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                      color: _confirmPasswordHasFocus
                          ? Color(0xFF0D9D57)
                          : Color(0xFF94A3B8)),
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
              ElevatedButton(
                onPressed: () {
                  // Proses hasil dari registrasi
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D9D57), // Background color
                  padding: EdgeInsets.symmetric(horizontal: 145, vertical: 15), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Register',
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
                    "Already have an account?",
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Login',
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