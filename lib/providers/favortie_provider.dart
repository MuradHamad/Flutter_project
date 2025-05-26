import 'package:flutter/material.dart';
import 'package:flutter_project/models/product.dart';
import 'package:provider/provider.dart';

class FavortieProvider extends ChangeNotifier {
  final List<Product> _favortie = [];
  List<Product> get getFavortie => _favortie;

  void toggleFavortie(Product product) {
    if (_favortie.contains(product)) {
      _favortie.remove(product);
    } else {
      _favortie.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    return _favortie.contains(product);
  }

  static FavortieProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavortieProvider>(context, listen: listen);
  }
}
