import 'package:json_annotation/json_annotation.dart';

part 'npc_data.g.dart';

@JsonSerializable()
class NPCData {
  final String id;
  final String name;
  final String description;
  final String image;
  final String smallImage;

  NPCData({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.smallImage,
  });

  factory NPCData.fromJson(Map<String, dynamic> json) => _$NPCDataFromJson(json);

  Map<String, dynamic> toJson() => _$NPCDataToJson(this);
}
