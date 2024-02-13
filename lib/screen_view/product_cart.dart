import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_store/screen_view/products.dart';

import 'cart.dart';
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
    var cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Container(
        width: 150,
        height: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: Colors.blue, width: 1),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                ),
                child: widget.imageUrl.isNotEmpty
                    ? Image.network(widget.imageUrl)
                    : const Placeholder(), // Placeholder or a default image
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
                ],
              ),
              const SizedBox(height: 5),
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
              TextButton(
                onPressed: () {
                  cartProvider.addToCart(Product(
                    name: widget.productName,
                    price: double.parse(widget.price),
                    imageUrl: widget.imageUrl,
                  ));

                  // Optionally, you can navigate to the shopping cart screen
                  Navigator.pushNamed(
                    context,
                    RouteName.shoppingCart,
                    arguments: {
                      'productName': 'Your Product Name',
                      'price': 'Your Product Price',
                      'imageUrl': 'Your Product Image URL',
                    },
                  );
                  ;
                },
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ),
            ])));
  }
}
