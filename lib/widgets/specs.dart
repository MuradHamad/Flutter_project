import 'package:flutter/material.dart';

class Specs extends StatefulWidget {
  final String title;

  const Specs({super.key, required this.title});

  @override
  State<Specs> createState() => _SpecsState();
}

class _SpecsState extends State<Specs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 90,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue),
      ),
      child: Text(widget.title, textAlign: TextAlign.center),
    );
  }
}
