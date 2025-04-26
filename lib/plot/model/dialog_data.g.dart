// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DialogData _$DialogDataFromJson(Map<String, dynamic> json) => DialogData(
  id: json['id'] as String,
  npc: json['npc'] as String,
  text: json['text'] as String,
  items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
  options:
      (json['options'] as List<dynamic>)
          .map((e) => DialogOption.fromJson(e as Map<String, dynamic>))
          .toList(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$DialogDataToJson(DialogData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'npc': instance.npc,
      'text': instance.text,
      'options': instance.options,
      'items': instance.items,
      'image': instance.image,
    };

DialogOption _$DialogOptionFromJson(Map<String, dynamic> json) => DialogOption(
  text: json['text'] as String,
  nextNode: PlotNode.fromJson(json['nextNode'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DialogOptionToJson(DialogOption instance) =>
    <String, dynamic>{'text': instance.text, 'nextNode': instance.nextNode};
