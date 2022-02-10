import 'package:json_annotation/json_annotation.dart';

part 'top_item.g.dart';

@JsonSerializable(createToJson: false)
class TopItem {
  final String? imageURL;
  final String? title;
  final String? subTitle;
  final String? price;

  TopItem(this.imageURL, this.title, this.subTitle, this.price);

  factory TopItem.fromJson(Map<String, dynamic>? json) {
      json ??= {};
    return _$TopItemFromJson(json);
  }
}
