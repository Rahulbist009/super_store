class Cart {
  int itemCount = 0;

  void addItem(String productName) {
    itemCount++;
  }

  void removeItem() {
    if (itemCount > 0) {
      itemCount--;
    }
  }
}
