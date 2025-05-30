import 'package:flutter/material.dart';
import 'package:flutter_project/models/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/utils/UserPreferences.dart';

class FavortieProvider extends ChangeNotifier {
  List<Product> _favortie = [];
  List<Product> get getFavortie => _favortie;

  FavortieProvider() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    _favortie = UserSimplePreferences.getFavoriteList() ?? [];
    notifyListeners();
  }

  Future<void> saveFavorites() async {
    await UserSimplePreferences.setFavoriteList(_favortie);
  }

  void toggleFavortie(Product product) {
    if (_favortie.contains(product)) {
      _favortie.remove(product);
    } else {
      _favortie.add(product);
    }
    saveFavorites();
    notifyListeners();
  }

  bool isExist(Product product) {
    return _favortie.contains(product);
  }

  static FavortieProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavortieProvider>(context, listen: listen);
  }
}
