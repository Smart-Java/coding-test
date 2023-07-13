import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:login_system/data/remote/authenticationData/loginResponseModel/login_response_model.dart';
import 'package:login_system/domain/loginRequest/login_request.dart';
import 'package:login_system/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:login_system/infrastructure/api/apiRequestHelper/api_request_helper.dart';
import 'package:login_system/infrastructure/util/failureResponse/failure_response.dart';

@injectable
class AuthenticationPageData {
  ApiRequestHelper apiRequestHelper;
  RetrieveFailedResponseClass retrieveFailedResponseClass;
  AuthenticationPageData(
    this.apiRequestHelper,
    this.retrieveFailedResponseClass,
  );

  Future loginAuthenticationRequest(
      {required LoginRequest loginRequest}) async {
    dynamic loginAuthenticationRequestResponse;
    loginAuthenticationRequestResponse = await apiRequestHelper.postRequest(
      APIEndPoints.loginEndPoint,
      isDataRequired: true,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      jsonData: loginRequest.toJson(),
    );
    return loginAuthenticationRequestResponse;
  }

  Future<Either<FailureResponse, LoginResponseModel>> responseOfLoginStatusCode(
      {required LoginRequest loginRequest}) async {
    var userLoginAuthResponse = await loginAuthenticationRequest(
      loginRequest: loginRequest,
    );
    debugPrint('this is the login response $userLoginAuthResponse');
    LoginResponseModel loginResponseModel;
    FailureResponse failureResponse;
    int getStatusCode = userLoginAuthResponse.statusCode;
    debugPrint('this is the login status $getStatusCode');

    switch (getStatusCode) {
      case 200:
        loginResponseModel =
            LoginResponseModel.fromJson(userLoginAuthResponse.data);
        return Right(loginResponseModel);
      default:
        failureResponse = FailureResponse(
          errorMessage: userLoginAuthResponse.data['message'],
          statusCode: getStatusCode,
        );
        return Left(failureResponse);
    }
  }
}
