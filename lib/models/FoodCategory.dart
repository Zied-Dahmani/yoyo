enum FoodCategory{
  Burger,
  Pizza,
  Glace,

}

extension ParseToString on FoodCategory {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
