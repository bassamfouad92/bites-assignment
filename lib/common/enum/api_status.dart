enum ApiStatus {
  success,
  unauthorized,
  badRequest,
  serverError,
  unknownError,
}

extension ApiStatusExtension on int {
  ApiStatus toApiStatus() {
    switch (this) {
      case 200:
        return ApiStatus.success;
      case 401:
        return ApiStatus.unauthorized;
      case 400:
        return ApiStatus.badRequest;
      case 500:
        return ApiStatus.serverError;
      default:
        return ApiStatus.unknownError;
    }
  }
}
