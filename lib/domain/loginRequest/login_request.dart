import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest extends Equatable {
  const LoginRequest(
      {required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginRequestToJson(this);
  }
}
