import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:super_store/screen_view/products.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    // Check if the product is already in the cart
    if (_cartItems.contains(product)) {
      showToast('Product already in the cart.');
    } else {
      _cartItems.add(product);
      notifyListeners();
    }
  }

  void removeItem(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

