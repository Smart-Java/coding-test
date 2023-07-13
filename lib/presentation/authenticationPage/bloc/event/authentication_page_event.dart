import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class AuthenticationPageEvent extends Equatable {
  const AuthenticationPageEvent();
}

// ignore: must_be_immutable
class LoginAuthenticationEvent extends AuthenticationPageEvent {
  String emailAddress;
  String password;
  LoginAuthenticationEvent({
    required this.emailAddress,
    required this.password,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
        password,
      ];
}

// ignore: must_be_immutable
class ValidateEmailAddressForAuthentication extends AuthenticationPageEvent {
  String emailAddress;
  ValidateEmailAddressForAuthentication({
    required this.emailAddress,
  }) : super();

  @override
  List<Object?> get props => [emailAddress];
}
