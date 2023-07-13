import 'package:either_dart/either.dart';
import 'package:login_system/data/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart';
import 'package:login_system/data/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:login_system/data/remote/authenticationData/dataProvider/authentication_page_data.dart';
import 'package:login_system/data/remote/authenticationData/loginResponseModel/login_response_model.dart';
import 'package:login_system/data/remote/authenticationData/repo/repoInterface/authentication_page_repo_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:login_system/domain/loginRequest/login_request.dart';
import 'package:login_system/infrastructure/dioClient/connectivityManager/model/connection.dart';
import 'package:login_system/infrastructure/util/failureResponse/failure_response.dart';

@Injectable(as: AuthenticationPageRepoInterface)
class AuthenticationPageRepo implements AuthenticationPageRepoInterface {
  final AuthenticationPageData authenticationPageData;
  final AppSharedPreferences appSharedPreferences;
  final Connection connection;
  final AppFlutterSecureStorage appFlutterSecureStorage;
  AuthenticationPageRepo(
    this.appSharedPreferences,
    this.authenticationPageData,
    this.appFlutterSecureStorage,
    this.connection,
  );

  @override
  Future<Either<FailureResponse, LoginResponseModel>>
      loginAuthenticationRepoRequest(
          {required LoginRequest loginRequest}) async {
    var isThereNetworkConnectionForProjectListRequest =
        await connection.isInternetEnabled();
    if (isThereNetworkConnectionForProjectListRequest == true) {
      var responseData = await authenticationPageData
          .responseOfLoginStatusCode(
        loginRequest: loginRequest,
      )
          .onError((error, stackTrace) {
        return Left(errorOccuredResponse);
      });
      if (responseData.isRight) {
        return Right(responseData.right);
      } else {
        return Left(responseData.left);
      }
    } else {
      return Left(networkErrorResponse);
    }
  }
}
