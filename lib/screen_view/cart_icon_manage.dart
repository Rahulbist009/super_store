class Cart {
  List<String> items = [];

  void addItem(String productName) {
    items.add(productName);
  }

  int get itemCount => items.length;
}
