import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'cart_icon_manage.dart';

class ShoppingCart extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final Cart cart;

  const ShoppingCart({
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.cart,  // Receive the cart instance
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.lime.shade200,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          var product = cartProvider.cartItems[index];
          return ListTile(
            leading: Image.network(product.imageUrl ??''), // Corrected here
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: ElevatedButton(
              onPressed: (){
                cartProvider.removeItem(product);
              }, child: const Text('Remove'),
            ),
            // Add any other product details you want to display
          );
        },
      ),
    );
  }
}
