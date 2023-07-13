import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:login_system/infrastructure/util/networkRequestMsgErrorStatusCodeConstantValueClass/network_request_error_msg_status_code_constant_value_class.dart';

FailureResponse networkErrorResponse = FailureResponse(
    errorMessage: 'Check your internet connection', statusCode: 0);

FailureResponse errorOccuredResponse =
    FailureResponse(errorMessage: 'An error Occured, try again', statusCode: 1);

// ignore: must_be_immutable
class FailureResponse extends Equatable {
  int statusCode;
  String errorMessage;
  FailureResponse({
    required this.errorMessage,
    required this.statusCode,
  });
  @override
  List<Object?> get props => [
        statusCode,
        errorMessage,
      ];
}

@injectable
class RetrieveFailedResponseClass {
  FailureResponse failedResponse({required int statusCode, required response}) {
    FailureResponse failureResponse;
    switch (statusCode) {
      case 500:
        failureResponse = FailureResponse(
          errorMessage:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.internalError,
          statusCode: statusCode,
        );
        break;
      case 404:
        failureResponse = FailureResponse(
          errorMessage:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.notFound,
          statusCode: statusCode,
        );
        break;
      case 400:
        failureResponse = FailureResponse(
          errorMessage:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest,
          statusCode: statusCode,
        );
        break;
      default:
        failureResponse = FailureResponse(
          errorMessage: response['message'],
          statusCode: statusCode,
        );
        break;
    }
    return failureResponse;
  }
}
