import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends Equatable {
  const LoginResponseModel(
      {this.message,});

  final String? message;

  @override
  List<Object?> get props => [message,];

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
