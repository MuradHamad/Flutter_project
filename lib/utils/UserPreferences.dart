import 'dart:convert';

import 'package:flutter_project/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setProductList(List<Product> products) async {
    _preferences?.setStringList(
      'products',
      products.map((p) => jsonEncode(p.toJson())).toList(),
    );
  }

  static List<Product>? getProductList() {
    final products = _preferences?.getStringList('products');
    return products != null
        ? products.map((p) => Product.fromJson(jsonDecode(p))).toList()
        : null;
  }

  static Future removeProductAt(int index) async {
    final products = await getProductList();
    if (products != null) {
      products.removeAt(index);
      await setProductList(products);
    }
  }

  static Future setFavoriteList(List<Product> products) async {
    _preferences?.setStringList(
      'favorites',
      products.map((p) => jsonEncode(p.toJson())).toList(),
    );
  }

  static List<Product>? getFavoriteList() {
    final favorites = _preferences?.getStringList('favorites');
    return favorites != null
        ? favorites.map((p) => Product.fromJson(jsonDecode(p))).toList()
        : null;
  }
}
