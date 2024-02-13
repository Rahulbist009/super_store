import 'package:flutter/material.dart';

import '../navigator/route_name.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productName;
  final String price;
  final String imageUrl;
  final String size;

  ProductDetailsPage({
    Key? key,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.size,
    required Map data,
  }) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  List<bool> selectedSizes = List.generate(5, (index) => false);
  bool isSizeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Product Name: ${widget.productName}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: \$${widget.price}',
              style: const TextStyle(fontSize: 20, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            const Text(
              'Select Size',
              style: TextStyle(fontSize: 20, color: Colors.teal),
            ),
            const SizedBox(height: 7),
            Wrap(
              spacing: 8,
              children: List.generate(
                sizes.length,
                    (index) => FilterChip(
                  label: Text(sizes[index]),
                  selected: selectedSizes[index],
                  onSelected: (selected) {
                    setState(() {
                      for (int i = 0; i < selectedSizes.length; i++) {
                        if (i == index) {
                          selectedSizes[i] = selected;
                        } else {
                          selectedSizes[i] = false;
                        }
                      }
                      isSizeSelected = selectedSizes.contains(true);
                    });
                  },
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                if (isSizeSelected) {
                  String selectedSize = sizes[selectedSizes.indexOf(true)];
                  Navigator.pushNamed(
                    context,
                    RouteName.addressDetails,
                    arguments: {
                      'productName': widget.productName,
                      'price': widget.price,
                      'imageUrl': widget.imageUrl,
                      'size': selectedSize,
                    },
                  );
                } else {
                  print('Please select a size before buying.');
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Center(
                  child: Text(
                    'BUY',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
