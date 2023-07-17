class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);
}

class FetchDataEception extends AppException {

  FetchDataEception([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {

  BadRequestException([String? message])
      : super(message, 'Invalid request');
}

class UnAuthorizedException extends AppException {

  UnAuthorizedException([String? message])
      : super(message, 'UnAuthorized request');
}
class InvalidInputException extends AppException {

  InvalidInputException([String? message])
      : super(message, 'Invalid Input');
}