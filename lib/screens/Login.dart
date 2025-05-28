import 'package:flutter/material.dart';
import 'package:flutter_project/auth/firebase_services.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/screens/sign_up.dart';
import 'package:flutter_project/widgets/formWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseServices _firebaseServices = FirebaseServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FormContainerWidget(
              controller: _emailController,
              labelText: 'Email',
              isPasswordField: false,
            ),
            SizedBox(height: 20),
            FormContainerWidget(
              controller: _passwordController,
              labelText: 'Password',
              isPasswordField: true,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _signIn,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                      (route) => false,
                    );
                  },
                  child: Text('SignUp', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    final user = await _firebaseServices.signInWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
    );
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainApp()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Sign in failed')));
    }
  }
}
