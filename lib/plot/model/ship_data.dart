import 'package:json_annotation/json_annotation.dart';

part 'ship_data.g.dart';

@JsonSerializable()
class ShipData {
  final String id;
  final String name;
  final String description;
  final String image;
  final Stats stats;

  ShipData({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.stats,
  });

  factory ShipData.fromJson(Map<String, dynamic> json) => _$ShipDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShipDataToJson(this);
}

@JsonSerializable()
class Stats {
  final int speed;
  final int handling;
  final int boost;

  Stats({required this.speed, required this.handling, required this.boost});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}
