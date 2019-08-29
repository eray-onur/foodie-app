class Food {
  final String name;
  final double price;
  int count;
  Food({this.name, this.price, this.count = 1}): assert(name != null), assert(price != null, count != null);
}