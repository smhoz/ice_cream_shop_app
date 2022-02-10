import 'package:json_annotation/json_annotation.dart';

part 'popular_ice_cream.g.dart';

@JsonSerializable(createToJson: false)
class PopularIceCream {
  final String? imageURL;
  final String? productName;

  PopularIceCream(this.imageURL, this.productName);

  factory PopularIceCream.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return _$PopularIceCreamFromJson(json);
  }
}
