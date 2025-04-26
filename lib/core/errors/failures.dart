import 'dart:convert';
import 'dart:io'; // For HttpException
import 'package:http/http.dart' as http;

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromHttpException(HttpException exception) {
    return ServerFailure(exception.message);
  }

  factory ServerFailure.fromHttpResponse(http.Response response) {
    final statusCode = response.statusCode;

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        final message = _extractErrorMessage(response.body);
        return ServerFailure(message);
      case 404:
        return ServerFailure('Your request not found, please try later!');
      case 500:
        return ServerFailure('Internal server error, please try later!');
      default:
        return ServerFailure('Oops! There was an error, please try again.');
    }
  }

  static String _extractErrorMessage(String responseBody) {
    try {
      final decoded = jsonDecode(responseBody);
      return decoded['error']['message'] ?? 'Unknown error occurred';
    } catch (e) {
      return 'Unexpected error format';
    }
  }
}
