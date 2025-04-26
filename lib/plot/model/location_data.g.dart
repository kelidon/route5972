// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationData _$LocationDataFromJson(Map<String, dynamic> json) => LocationData(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  npcIds: (json['npcIds'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$LocationDataToJson(LocationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'npcIds': instance.npcIds,
    };
