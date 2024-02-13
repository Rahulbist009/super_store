import 'package:flutter/material.dart';


class ProductSearch extends SearchDelegate<String> {
  final List<String> productList;

  ProductSearch(this.productList);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = productList
        .where((product) => product.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index]),
            onTap: () {
              close(context, results[index]);
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = productList
        .where((product) => product.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index]),
            onTap: () {
              query = suggestions[index];
            },
          );
        });
  }
}
