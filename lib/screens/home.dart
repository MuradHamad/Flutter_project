import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/detailed_page.dart';
import 'package:flutter_project/screens/favorite.dart';
import 'package:flutter_project/screens/profile.dart';
import 'package:flutter_project/models/shop_products.dart';
import 'package:flutter_project/widgets/product_card.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _bulidProductCatagory(name: 'All Products', index: 0),
              _bulidProductCatagory(name: 'office', index: 1),
              _bulidProductCatagory(name: 'adobe', index: 2),
            ],
          ),
          Expanded(
            child:
                isSelcted == 0
                    ? _bulidAllProducts()
                    : isSelcted == 1
                    ? _bulidOfficeProduct()
                    : _bulidAdobeProduct(),
          ),
        ],
      ),
    );
  }

  _bulidProductCatagory({required String name, required int index}) =>
      GestureDetector(
        onTap:
            () => {
              setState(() {
                isSelcted = index;
              }),
            },
        child: Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelcted == index ? Colors.blue : Colors.blue.shade200,
          ),
          child: Text(name, style: TextStyle(color: Colors.white)),
        ),
      );
  _bulidAllProducts() => Container(
    margin: EdgeInsets.only(top: 10),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        mainAxisExtent: 250,
        crossAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: ShopProduct.alProducts.length,
      itemBuilder: (context, index) {
        final allProduct = ShopProduct.alProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedPage(product: allProduct),
              ),
            );
          },
          child: ProductCard(product: allProduct),
        );
      },
    ),
  );
  _bulidOfficeProduct() => Container(
    margin: EdgeInsets.only(top: 10),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        mainAxisExtent: 250,
        crossAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: ShopProduct.office.length,
      itemBuilder: (context, index) {
        final officeProducts = ShopProduct.office[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedPage(product: officeProducts),
              ),
            );
          },
          child: ProductCard(product: officeProducts),
        );
      },
    ),
  );
  _bulidAdobeProduct() => Container(
    margin: EdgeInsets.only(top: 10),
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12,
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        mainAxisExtent: 250,
        crossAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: ShopProduct.adobe.length,
      itemBuilder: (context, index) {
        final adobeProducts = ShopProduct.adobe[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailedPage(product: adobeProducts),
              ),
            );
          },
          child: ProductCard(product: adobeProducts),
        );
      },
    ),
  );
}
