import 'package:json_annotation/json_annotation.dart';
import 'package:route5972/plot/model/plot_node.dart';

part 'dialog_data.g.dart';

@JsonSerializable()
class DialogData {
  final String id;
  final String npc;
  final String text;
  final List<DialogOption> options;
  final List<String> items;
  final String? image;

  DialogData({
    required this.id,
    required this.npc,
    required this.text,
    required this.items,
    required this.options,
    this.image,
  });

  factory DialogData.fromJson(Map<String, dynamic> json) => _$DialogDataFromJson(json);

  Map<String, dynamic> toJson() => _$DialogDataToJson(this);
}

@JsonSerializable()
class DialogOption {
  final String text;
  final PlotNode nextNode;

  DialogOption({required this.text, required this.nextNode});

  factory DialogOption.fromJson(Map<String, dynamic> json) => _$DialogOptionFromJson(json);

  Map<String, dynamic> toJson() => _$DialogOptionToJson(this);
}
