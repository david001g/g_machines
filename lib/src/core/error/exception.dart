class ServerException implements Exception {
  final String message;

  ServerException({required this.message});

  @override
  String toString() => message;
}

class SupaBaseException implements Exception {
  final String message;

  SupaBaseException({required this.message});

  @override
  String toString() => message;
}
