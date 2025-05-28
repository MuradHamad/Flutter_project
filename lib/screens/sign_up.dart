import 'package:flutter/material.dart';
import 'package:flutter_project/auth/firebase_services.dart';
import 'package:flutter_project/screens/login.dart';
import 'package:flutter_project/widgets/formWidget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseServices _firebaseServices = FirebaseServices();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
              'SignUp',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FormContainerWidget(
              controller: _usernameController,
              labelText: 'Username',
              isPasswordField: false,
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
              onTap: _signUp,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'SignUp',
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
                Text('Already have an account?'),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (route) => false,
                    );
                  },
                  child: Text('Login', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    final user = await _firebaseServices.signUpWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
    );
    if (user != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Sign up failed')));
    }
  }
}
