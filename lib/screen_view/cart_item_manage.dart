import 'package:flutter/material.dart';

class CartIconManager extends ChangeNotifier {
  int itemCount = 0;

  void updateCartIcon(int newCount) {
    itemCount = newCount;
    // Notify listeners or update your UI accordingly
    notifyListeners();
  }
}
