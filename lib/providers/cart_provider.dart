import 'package:flutter/material.dart';
import 'package:flutter_project/models/product.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  void toggleProduct(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  void incrementQuantity(int index) => _cart[index].quantity++;

  void decrementQuantity(int index) => _cart[index].quantity--;

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
