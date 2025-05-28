import 'package:flutter/material.dart';
import 'package:flutter_project/screens/Login.dart';
import 'package:flutter_project/screens/home.dart';

class Splash extends StatefulWidget {
  final Widget? child;
  const Splash({super.key, required this.child});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget.child!),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'loading...',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
