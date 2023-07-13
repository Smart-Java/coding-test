import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:login_system/data/remote/authenticationData/loginResponseModel/login_response_model.dart';
import 'package:login_system/data/remote/authenticationData/repo/repoInterface/authentication_page_repo_interface.dart';
import 'package:login_system/domain/loginRequest/login_request.dart';
import 'package:login_system/infrastructure/util/failureResponse/failure_response.dart';
import 'package:login_system/presentation/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:login_system/presentation/authenticationPage/bloc/state/authentication_page_state.dart';

@injectable
class AuthenticationPageBloc
    extends Bloc<AuthenticationPageEvent, AuthenticationPageState> {
  final AuthenticationPageRepoInterface authenticationPageRepo;

  AuthenticationPageBloc(
    this.authenticationPageRepo,
  ) : super(const AuthenticationPageState()) {
    on<LoginAuthenticationEvent>((event, emit) async {
      if (event.password.isNotEmpty && event.emailAddress.isNotEmpty) {
        emit(
          state.copyWith(
            isLoading: true,
            isEmailFieldEmpty: false,
            isPasswordFieldEmpty: false,
          ),
        );
        var emailAddress = event.emailAddress;
        var password = event.password;

        Either<FailureResponse, LoginResponseModel> requestResponse =
            await authenticationPageRepo.loginAuthenticationRepoRequest(
          loginRequest: LoginRequest(
            email: emailAddress,
            password: password,
          ),
        );

        if (requestResponse.isRight) {
          emit(
            state.copyWith(
              isLoading: false,
              authenticationMessage: requestResponse.right.message ?? 'Login successfully done',
              isRequestSuccessful: true,
              isEmailFieldEmpty: false,
              isPasswordFieldEmpty: false,
            ),
          );
        } else {
          var responseMessage = requestResponse.left.errorMessage;
          emit(
            state.copyWith(
              isLoading: false,
              authenticationMessage: responseMessage.replaceFirst(
                  responseMessage[0], responseMessage[0].toUpperCase()),
              isRequestSuccessful: false,
              isEmailFieldEmpty: false,
              isPasswordFieldEmpty: false,
            ),
          );
        }
      } else {
        if (event.emailAddress.isEmpty && event.password.isEmpty) {
          emit(
            state.copyWith(
              isLoading: false,
              isEmailFieldEmpty: true,
              isPasswordFieldEmpty: true,
            ),
          );
        } else {
          if (event.emailAddress.isEmpty) {
            emit(
              state.copyWith(
                isLoading: false,
                isEmailFieldEmpty: true,
              ),
            );
          } else {
            emit(
              state.copyWith(
                isLoading: false,
                isPasswordFieldEmpty: true,
              ),
            );
          }
        }
      }
    });
    on<ValidateEmailAddressForAuthentication>((event, emit) async {
      if (event.emailAddress.isNotEmpty) {
        var email = event.emailAddress;
        bool isEmailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
        debugPrint(isEmailValid.toString());

        emit(
          state.copyWith(
            isEmailAddressFormatTrue: isEmailValid,
            isLoading: false,
          ),
        );
      }
    });
  }
}
