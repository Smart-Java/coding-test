import 'package:either_dart/either.dart';
import 'package:login_system/data/remote/authenticationData/loginResponseModel/login_response_model.dart';
import 'package:login_system/domain/loginRequest/login_request.dart';
import 'package:login_system/infrastructure/util/failureResponse/failure_response.dart';

abstract class AuthenticationPageRepoInterface {
  Future<Either<FailureResponse, LoginResponseModel>>
      loginAuthenticationRepoRequest(
          {required LoginRequest loginRequest});
}
