// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipData _$ShipDataFromJson(Map<String, dynamic> json) => ShipData(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShipDataToJson(ShipData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'image': instance.image,
  'stats': instance.stats,
};

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
  speed: (json['speed'] as num).toInt(),
  handling: (json['handling'] as num).toInt(),
  boost: (json['boost'] as num).toInt(),
);

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
  'speed': instance.speed,
  'handling': instance.handling,
  'boost': instance.boost,
};
