// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  year: (json['year'] as num).toInt(),
  age: (json['age'] as num?)?.toInt(),
  distillery: json['distillery'] as String,
  region: json['region'] as String,
  country: json['country'] as String,
  type: json['type'] as String,
  ageStatement: json['ageStatement'] as String,
  filled: json['filled'] as String,
  bottled: json['bottled'] as String,
  caskNumber: json['caskNumber'] as String,
  abv: json['abv'] as String,
  size: json['size'] as String,
  finish: json['finish'] as String,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'year': instance.year,
  'age': instance.age,
  'distillery': instance.distillery,
  'region': instance.region,
  'country': instance.country,
  'type': instance.type,
  'ageStatement': instance.ageStatement,
  'filled': instance.filled,
  'bottled': instance.bottled,
  'caskNumber': instance.caskNumber,
  'abv': instance.abv,
  'size': instance.size,
  'finish': instance.finish,
};
