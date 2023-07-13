import 'package:equatable/equatable.dart';

class AuthenticationPageState extends Equatable {
  const AuthenticationPageState({
    this.isLoading,
    this.isEmailFieldEmpty,
    this.isPasswordFieldEmpty,
    this.isRequestSuccessful,
    this.isEmailAddressFormatTrue,
    this.authenticationMessage,
  });

  final bool? isLoading;
  final bool? isEmailFieldEmpty;
  final bool? isPasswordFieldEmpty;
  final bool? isRequestSuccessful;
  final bool? isEmailAddressFormatTrue;
  final String? authenticationMessage;

  @override
  List<Object?> get props => [
        isLoading,
        isEmailFieldEmpty,
        isPasswordFieldEmpty,
        isRequestSuccessful,
        authenticationMessage,
        isEmailAddressFormatTrue,
      ];

  AuthenticationPageState copyWith({
    bool? isLoading,
    bool? isEmailFieldEmpty,
    bool? isPasswordFieldEmpty,
    bool? isRequestSuccessful,
    bool? isEmailAddressFormatTrue,
    String? authenticationMessage,
  }) {
    return AuthenticationPageState(
      isLoading: isLoading,
      isEmailFieldEmpty: isEmailFieldEmpty,
      isPasswordFieldEmpty: isPasswordFieldEmpty,
      isRequestSuccessful: isRequestSuccessful,
      authenticationMessage: authenticationMessage,
      isEmailAddressFormatTrue: isEmailAddressFormatTrue,
    );
  }
}
