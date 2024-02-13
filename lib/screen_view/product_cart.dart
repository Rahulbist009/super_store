import 'package:flutter/material.dart';

import 'cart_icon_manage.dart';
import 'cart_item_manage.dart';

import '../navigator/route_name.dart';

class ProductCart extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final Cart cart;

  const ProductCart({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.cart,
  }) : super(key: key);

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 295,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: Colors.blue, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
              ),
              child: Image.network(widget.imageUrl),
            ),
            const SizedBox(height: 8),
            Text(
              widget.productName,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '\$${widget.price}',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Add the product to the cart
                    widget.cart.addItem(widget.productName);

                    // Show a snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Product added to cart: ${widget.productName}'),
                      ),
                    );

                    // Update the shopping cart icon in the app bar
                    CartIconManager.updateCartIcon(context, widget.cart.itemCount);
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.add_shopping_cart_outlined),
                      Text('$quantity'),
                    ],
                  ),
                ),

              ],
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.productDetails,
                  arguments: {
                    'productName': widget.productName,
                    'price': widget.price,
                    'imageUrl': widget.imageUrl,
                  },
                );
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(11)),
                child: const Center(
                  child: Text(
                    'Buy',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
