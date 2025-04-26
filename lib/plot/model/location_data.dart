import 'package:json_annotation/json_annotation.dart';

part 'location_data.g.dart';

@JsonSerializable()
class LocationData {
  final String id;
  final String name;
  final String description;
  final String image;
  final List<String> npcIds;

  LocationData({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.npcIds,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) => _$LocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDataToJson(this);
}
