
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/register.dart';
import 'package:mobile/pages/firebase_auth_service.dart';
import 'package:mobile/pages/main_page.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void login() async {
      String email = _emailController.text;
      String password = _passwordController.text;
      User? user =
          await _authService.loginWithEmailandPassword(email, password, context);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Success"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Failed"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        color: Colors.black, // Background color black
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login to continue",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white), // Text color white
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white), // Text color white when typing
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.white), // Icon color white
                hintText: "Email Address",
                hintStyle: TextStyle(color: Colors.white), // Hint text color white
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              style: TextStyle(color: Colors.white), // Text color white when typing
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key, color: Colors.white), // Icon color white
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white), // Hint text color white
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color blue
                ),
                onPressed: () {
                  login();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don’t have an account?", style: TextStyle(color: Colors.white)), // Text color white
                const SizedBox(width: 4.0),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: const Text(
                    "Register.",
                    style: TextStyle(color: Colors.blue), // Text color blue
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
