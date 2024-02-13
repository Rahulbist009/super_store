// cart_icon_manager.dart

import 'package:flutter/material.dart';

class CartIconManager {
  static int itemCount = 0;

  static void updateCartIcon(BuildContext context, int newCount) {
    itemCount = newCount;
    // Notify listeners or update your UI accordingly
    // For simplicity, I'm just printing the new count here
    print('Cart icon updated. New count: $itemCount');
  }
}
