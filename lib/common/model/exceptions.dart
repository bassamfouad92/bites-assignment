class NoDataException implements Exception {
  @override
  String toString() {
    return 'No data is available';
  }
}

class UnAuthorizedException implements Exception {
  @override
  String toString() {
    return 'Please sign in again';
  }
}

class NotFoundException implements Exception {
  String message;

  NotFoundException({this.message = 'Not found'});

  @override
  String toString() {
    return message;
  }
}

class APIFailedException implements Exception {
  String message;

  APIFailedException({this.message = 'Server not responding'});

  @override
  String toString() {
    return message;
  }
}
