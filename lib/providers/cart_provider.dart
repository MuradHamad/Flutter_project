import 'package:flutter/material.dart';
import 'package:flutter_project/models/product.dart';
import 'package:flutter_project/utils/UserPreferences.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cart = [];

  List<Product> get cart => _cart;

  CartProvider() {
    loadCart();
  }

  Future<void> loadCart() async {
    _cart = await UserSimplePreferences.getProductList() ?? [];
    notifyListeners();
  }

  Future<void> saveCart() async {
    await UserSimplePreferences.setProductList(_cart);
  }

  void toggleProduct(Product product) {
    final index = _cart.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(product);
    }
    saveCart();
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _cart[index].quantity++;
    saveCart();
    notifyListeners();
  }

  void decrementQuantity(int index) {
    _cart[index].quantity--;
    saveCart();
    notifyListeners();
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }

  double getTotalPrice() {
    double total = 0;
    for (Product product in _cart) {
      total += product.price * product.quantity;
    }
    return total;
  }
}
