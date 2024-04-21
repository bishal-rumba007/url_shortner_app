

class NoInternetException implements Exception {
  @override
  String toString() => 'No internet connection. Please check your connection and try again.';
}

class ApiRequestException implements Exception {
  final String message;
  ApiRequestException(this.message);

  @override
  String toString() => 'Failed to shorten URL: $message';
}