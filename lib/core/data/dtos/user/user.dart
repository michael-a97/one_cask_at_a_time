import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String email;
  final String password;

  const User({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
