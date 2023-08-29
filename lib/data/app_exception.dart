// ignore_for_file: prefer_typing_uninitialized_variables

class AppException implements Exception {
  // ignore: unused_field
  final _message;
  // ignore: unused_field
  final _prefix;

  AppException([this._message, this._prefix]);
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, 'UnAuthorized request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
