import 'package:json_annotation/json_annotation.dart';
import 'package:route5972/plot/model/plot_node.dart' show PlotNode;

part 'race_data.g.dart';

@JsonSerializable()
class RaceData {
  final String id;
  final String name;
  final String mapAsset;
  final String description;
  final PlotNode successNode;
  final PlotNode failureNode;

  RaceData({
    required this.id,
    required this.name,
    required this.mapAsset,
    required this.description,
    required this.successNode,
    required this.failureNode,
  });

  factory RaceData.fromJson(Map<String, dynamic> json) => _$RaceDataFromJson(json);

  Map<String, dynamic> toJson() => _$RaceDataToJson(this);
}
