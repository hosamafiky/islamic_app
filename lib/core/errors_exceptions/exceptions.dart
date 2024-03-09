class ServerException implements Exception {
  final String message;

  ServerException({required this.message});

  @override
  String toString() => message;
}

class UnhandledCodeException implements Exception {
  final String message;

  UnhandledCodeException({required this.message});

  @override
  String toString() => "Unhandled Exception: $message";
}

class NetworkException implements Exception {
  @override
  String toString() => "No Internet Connection";
}

class EmptyCacheException implements Exception {
  @override
  String toString() => "Cache is Empty";
}
