import 'package:json_annotation/json_annotation.dart';

part 'item_data.g.dart';

@JsonSerializable()
class ItemData {
  final String id;
  final String name;
  final String description;
  final String? image;

  ItemData({required this.id, required this.name, required this.description, this.image});

  factory ItemData.fromJson(Map<String, dynamic> json) => _$ItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDataToJson(this);
}
