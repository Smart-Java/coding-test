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
        if (statusCode == 422) {
          String errorMessage = errorMessageHandlingFromDB(response: response);
          failureResponse = FailureResponse(
            errorMessage: errorMessage,
            statusCode: statusCode,
          );
        } else {
          failureResponse = FailureResponse(
            errorMessage: response['data']['message'],
            statusCode: statusCode,
          );
        }
        break;
    }
    return failureResponse;
  }

  FailureResponse mapFailedResponse({
    required int statusCode,
  }) {
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
          errorMessage: 'An error occured, try again',
          statusCode: statusCode,
        );
        break;
    }
    return failureResponse;
  }

  String errorMessageHandlingFromDB({required response}) {
    String message = '';
    var passwordError = response['data']['errors']['password'];
    var phoneNumberError = response['data']['errors']['phoneNumber'];
    var emailError = response['data']['errors']['email'];

    if (passwordError != null && passwordError.length > 0) {
      message = passwordError[passwordError.length - 1];
    } else if (emailError != null && emailError.length > 0) {
      message = emailError[emailError.length - 1];
    } else if (phoneNumberError != null && phoneNumberError.length > 0) {
      message = phoneNumberError[phoneNumberError.length - 1];
    } else {
      message = response['data']['message'];
    }
    return message;
  }
}
