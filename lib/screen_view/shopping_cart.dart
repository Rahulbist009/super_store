import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Product Details'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' ${widget.productName}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Price \$${widget.price}',
                      style: const TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ]),
        ));
  }
}
