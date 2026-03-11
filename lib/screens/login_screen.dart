import 'package:flutter/material.dart';

import 'signup_screen.dart';
import 'forgot_password_screen.dart'; // ✅ CREATE THIS FILE

// DASHBOARDS
import 'home_screen.dart'; // USER
import 'admin/admin_dashboard.dart';
import 'staff/staff_dashboard.dart';
import 'support/support_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false; // ✅ SHOW PASSWORD TOGGLE

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// 🔹 TOP IMAGE
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/images/login.jpg',
                fit: BoxFit.cover,
              ),
            ),

            /// 🔹 CURVED CONTAINER
            Container(
              transform: Matrix4.translationValues(0, -40, 0),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 10),

                  const Center(
                    child: Text(
                      "WELCOME BACK!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Center(
                    child: Text(
                      "Login to continue",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// 🔹 USERNAME FIELD
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// 🔹 PASSWORD FIELD
                  TextField(
                    controller: _passwordController,
                    obscureText: !_showPassword, // ✅ Toggle
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  /// 🔹 SHOW PASSWORD + FORGOT PASSWORD
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// SHOW PASSWORD CHECKBOX
                      Row(
                        children: [
                          Checkbox(
                            value: _showPassword,
                            activeColor: const Color(0xFF1F8A70),
                            onChanged: (value) {
                              setState(() {
                                _showPassword = value!;
                              });
                            },
                          ),
                          const Text("Show Password"),
                        ],
                      ),

                      /// FORGOT PASSWORD
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 LOGIN BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _handleLogin(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F8A70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// 🔹 SIGN UP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔐 USERNAME + PASSWORD BASED LOGIN
  void _handleLogin(BuildContext context) {

    String username = _usernameController.text.trim().toLowerCase();
    String password = _passwordController.text.trim();

    Widget? nextScreen;

    if (username == "admin" && password == "000") {
      nextScreen = const AdminDashboard();
    } 
    else if (username == "staff" && password == "1234") {
      nextScreen = const StaffDashboard();
    } 
    else if (username == "user" && password == "123") {
      nextScreen = const HomeScreen();
    } 
    else if (username == "system" && password == "12345") {
      nextScreen = const SupportDashboard();
    } 
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Username or Password"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => nextScreen!),
    );
  }
}
