import 'package:json_annotation/json_annotation.dart';

part 'plot_node.g.dart';

@JsonSerializable()
class PlotNode {
  final String type;
  final String id;

  PlotNode({
    required this.type,
    required this.id,
  });

  factory PlotNode.fromJson(Map<String, dynamic> json) => _$PlotNodeFromJson(json);

  Map<String, dynamic> toJson() => _$PlotNodeToJson(this);
}
