// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NPCData _$NPCDataFromJson(Map<String, dynamic> json) => NPCData(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  smallImage: json['smallImage'] as String,
);

Map<String, dynamic> _$NPCDataToJson(NPCData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'image': instance.image,
  'smallImage': instance.smallImage,
};
