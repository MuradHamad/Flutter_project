import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/favorite.dart';
import 'package:flutter_project/screens/profile.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int isSelcted = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Our Products',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
            textAlign: TextAlign.left,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bulidProductCatagory(name: 'All Products', index: 0),
              _bulidProductCatagory(name: 'Adobe', index: 1),
              _bulidProductCatagory(name: 'Office', index: 2),
            ],
          ),
        ],
      ),
    );
  }

  _bulidProductCatagory({required String name, required int index}) =>
      Container(
        width: 100,
        height: 40,
        margin: EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelcted == index ? Colors.blue : Colors.blue.shade200,
        ),
        child: Text(name, style: TextStyle(color: Colors.white)),
      );
}
