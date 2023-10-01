import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginPayloadDto extends Equatable {
  final String email;
  final String password;

  const LoginPayloadDto({required this.email, required this.password});

  factory LoginPayloadDto.fromJson(Map<String, dynamic> json) =>
      _$LoginPayloadDtoFromJson(json);

  @override
  List<Object?> get props => [email, password];

  Map<String, String> toJson() => {'email': email, 'password': password};
}
