import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:super_store/screen_view/product_cart.dart';
import 'package:super_store/screen_view/product_search.dart';

import '../navigator/route_name.dart';
import 'cart_icon_manage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Example:
  final Cart _cart = Cart(); // Make sure to initialize your Cart instance


  // Example:
  final List<String> productList = [
    '17" Laptop Bag with Zip Pockets',
    'Free, printable, customizable t-shirt',
    // Add more product names
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SUPER STORE ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: ProductSearch(productList));
            },
            icon: const Icon(Icons.search),
          ),
          CartBadge(cart: _cart),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffa18ffeb),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg'),
              ),
              accountName: Text(
                'SUPER STORE',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              accountEmail: Text('superStore@gmail.com',
                  style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {
                // Handle Cart tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Profile'),
              onTap: () {
                // Handle Profile tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                // Handle Logout tap
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ProductCart(
                      imageUrl:
                      'https://ca.frankandoak.com/cdn/shop/files/2120225-017_800x.jpg?v=1692209329',
                      productName: 'The Essential T-Shirt in Bright White',
                      price: '100',
                      cart: _cart,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ProductCart(
                      imageUrl:
                      'https://marketplace.canva.com/print-mockup/bundle/E9Me4jcyzMX/fit:female,pages:double-sided,surface:marketplace/product:171618,surface:marketplace/EAFLsJd5odY/1/0/933w/canva-black-bold-logo-text-graphic-t-shirt-xBtZhbBcHcY.png?sig=64788a1a4a704de7ec24a4b06ed394d5&width=400',
                      productName: 'Free, printable, customizable t-shirt',
                      price: '150',
                      cart: _cart,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://4.imimg.com/data4/RU/VC/MY-11853389/men-s-jackets.jpg',
                        productName: "Men's Jackets at Rs 700 | Ludhiana",
                        price: '320',
                        cart: _cart,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://tiimg.tistatic.com/fp/1/008/501/men-full-sleeves-winter-fur-shirt-for-casual-wear-445.jpg',
                        productName: 'Men Full Sleeves Winter Fur Shirt',
                        price: '190',
                        cart: _cart,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://rukminim2.flixcart.com/image/612/612/xif0q/jean/3/r/b/28-hsmjns23009-2-high-star-original-imagpv529rwffsfv.jpeg?q=70',
                        productName: "Men Regular Mid Rise Blue Jeans",
                        price: '333',
                        cart: _cart,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://rukminim2.flixcart.com/image/612/612/kybvo280/jean/c/3/n/30-12983748-mast-harbour-original-imagakxh2ssjghsu.jpeg?q=70',
                        productName: 'Men Slim Mid Rise Dark Grey Jeans',
                        price: '300',
                        cart: _cart,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://rukminim2.flixcart.com/image/612/612/xif0q/blazer/k/q/t/36-sb-charcoal-manq-original-imaeh6t6jxfbex6u-bb.jpeg?q=70',
                        productName: "Men Solid Single Breasted Formal (Grey)",
                        price: '533',
                        cart: _cart,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://rukminim2.flixcart.com/image/832/832/kzpw2vk0/blazer/x/h/2/-original-imagbnwgeqjhk96g.jpeg?q=70&crop=false',
                        productName: 'Men Checkered Single Breasted  (Grey)',
                        price: '350',
                        cart: _cart,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/f/m/y/-original-imagua5whpkavjkn.jpeg?q=70',
                        productName: "Trekking Shoes For Men",
                        price: '230',
                        cart: _cart,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/q/9/h/-original-imagudcggbxzn7vs.jpeg?q=70',
                        productName: '1RuNX TR Hugo Outdoors For Men',
                        price: '900',
                        cart: _cart,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://rukminim2.flixcart.com/image/612/612/xif0q/sweatshirt/e/g/b/s-hd-aw-grey-s-heradawn-original-imagtwrsfrxhhjcy.jpeg?q=70',
                        productName: " Printed Men Sweatshirt",
                        price: '320',
                        cart: _cart,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ProductCart(
                        imageUrl:
                        'https://rukminim2.flixcart.com/image/612/612/xif0q/sweatshirt/x/6/w/xl-plan-black-odestar-original-imaguhngabg3spw8.jpeg?q=70',
                        productName: 'Full Sleeve Solid Hooded Sweatshirt  ',
                        price: '190',
                        cart: _cart,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CartBadge extends StatefulWidget {
  final Cart cart;

  const CartBadge({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  _CartBadgeState createState() => _CartBadgeState();
}

class _CartBadgeState extends State<CartBadge> {
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -2, end: -2),
      badgeContent: Text(
        widget.cart.itemCount.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child: IconButton(
        onPressed: () {
          // Open the cart screen or perform other actions
          Navigator.pushNamed(
            context,
            RouteName.shoppingCart,
            arguments: {
              'cart': widget.cart,  // Pass the cart instance
            },
          );
        },
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CartBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cart.itemCount != widget.cart.itemCount) {
      // Rebuild the badge when the cart item count changes
      print('Badge updated. New count: ${widget.cart.itemCount}');
      setState(() {});
    }
  }
}