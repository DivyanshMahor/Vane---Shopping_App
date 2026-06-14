class ProductModel {
  final int id;
  final String title;
  final String desc;
  final double price;
  final double rating;
  final String thumb;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.price,
    required this.rating,
    required this.thumb,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      desc: json["description"],
      price: (json["price"] as num).toDouble(),
      rating: (json["rating"] as num).toDouble(),
      thumb: json["thumbnail"],
      category: json["category"],
    );
  }
}
