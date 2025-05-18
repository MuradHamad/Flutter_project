import 'package:flutter/widgets.dart';

import 'product.dart';

class ShopProduct {
  static List<Product> products = [
    Product(
      id: 1,
      name: 'PhotoShop',
      catagory: 'Adobe',
      image: 'image',
      price: 100,
      description: 'photoshop from adobe',
      quantity: 100,
    ),
  ];
}
