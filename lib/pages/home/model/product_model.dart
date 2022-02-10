import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(createToJson: false)
class Product {
  final String? productName;
  final String? imageURL;
  final String? price;
  final String? description;
  final int? review;
  final double? rating;
  final String? weight;
  Product({
    this.productName,
    this.imageURL,
    this.price,
    this.description,
    this.review,
    this.rating,
    this.weight,
  });

  factory Product.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return _$ProductFromJson(json);
  }

  @override
  String toString() {
    return 'Product(productName: $productName, imageURL: $imageURL, price: $price, rating: $rating, weight: $weight)';
  }
}
