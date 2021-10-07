class Cart {
  List<String> foodId;

  Cart(this.foodId);

  void addFood(String foodId) {
    this.foodId.add(foodId);
  }
}