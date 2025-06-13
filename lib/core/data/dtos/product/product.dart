import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int id;
  final String name;
  final int year;
  final int? age;
  final String? distillery;
  final String? region;
  final String? country;
  final String? type;
  final String? ageStatement;
  final String? filled;
  final String? bottled;
  final String? caskNumber;
  final String? abv;
  final String? size;
  final String? finish;

  const Product({
    required this.id,
    required this.name,
    required this.year,
    this.age,
    this.distillery,
    this.region,
    this.country,
    this.type,
    this.ageStatement,
    this.filled,
    this.bottled,
    this.caskNumber,
    this.abv,
    this.size,
    this.finish,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    age,
    distillery,
    region,
    country,
    type,
    ageStatement,
    filled,
    bottled,
    caskNumber,
    abv,
    size,
    finish,
  ];
}
