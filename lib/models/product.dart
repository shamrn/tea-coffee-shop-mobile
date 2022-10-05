class Product {
  int id;
  String name;
  double volume;
  String price;
  String? image;

  Product(
      {required this.id,
      required this.name,
      required this.volume,
      required this.price,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        volume: json['volume'],
        price: json['price'],
        image: json['image']);
  }
}
