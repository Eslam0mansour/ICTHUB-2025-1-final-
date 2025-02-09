class ProductDataModel {
  final String title;
  final String description;
  final String image;
  final num price;

  ProductDataModel({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
    );
  }
}
