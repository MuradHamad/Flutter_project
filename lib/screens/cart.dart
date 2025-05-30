import 'package:flutter/material.dart';
import 'package:flutter_project/providers/cart_provider.dart';
import 'package:flutter_project/utils/UserPreferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final cartList = provider.cart;

    _buildProductQuitity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQuantity(index)
                : provider.decrementQuantity(index);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade100,
          ),
          child: Icon(icon, size: 20),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body:
          cartList.isEmpty
              ? Center(
                child: Text(
                  'Your cart is empty!',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder:
                          (context, index) => Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      UserSimplePreferences.removeProductAt(
                                        index,
                                      );
                                      cartList[index].quantity = 1;
                                      cartList.removeAt(index);
                                      setState(() {});
                                    },
                                    icon: Icons.delete,
                                    backgroundColor: Colors.red,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  cartList[index].name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  cartList[index].description,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    cartList[index].image,
                                  ),
                                ),
                                trailing: Container(
                                  width: 60,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildProductQuitity(Icons.add, index),
                                        SizedBox(height: 4),
                                        Text(
                                          "${cartList[index].quantity}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        _buildProductQuitity(
                                          Icons.remove,
                                          index,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '\$ ${provider.getTotalPrice()}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.send),
                          label: Text('Checkout'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
