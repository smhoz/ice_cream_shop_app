// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productName: json['productName'] as String?,
      imageURL: json['imageURL'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      review: json['review'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      weight: json['weight'] as String?,
    );
