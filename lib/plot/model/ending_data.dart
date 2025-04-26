import 'package:json_annotation/json_annotation.dart';

part 'ending_data.g.dart';

@JsonSerializable()
class EndingData {
  final String id;
  final String name;
  final String description;

  EndingData({required this.id, required this.name, required this.description});

  factory EndingData.fromJson(Map<String, dynamic> json) => _$EndingDataFromJson(json);

  Map<String, dynamic> toJson() => _$EndingDataToJson(this);
}
