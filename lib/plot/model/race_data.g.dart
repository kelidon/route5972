// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaceData _$RaceDataFromJson(Map<String, dynamic> json) => RaceData(
  id: json['id'] as String,
  name: json['name'] as String,
  mapAsset: json['mapAsset'] as String,
  description: json['description'] as String,
  successNode: PlotNode.fromJson(json['successNode'] as Map<String, dynamic>),
  failureNode: PlotNode.fromJson(json['failureNode'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RaceDataToJson(RaceData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'mapAsset': instance.mapAsset,
  'description': instance.description,
  'successNode': instance.successNode,
  'failureNode': instance.failureNode,
};
