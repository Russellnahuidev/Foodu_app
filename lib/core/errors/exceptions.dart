class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException({required this.message, this.statusCode});

  @override
  String toString() => 'AppException: $message (status: $statusCode)';
}

class NetworkException extends AppException {
  const NetworkException({super.message = 'Error de red', super.statusCode});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException()
    : super(message: 'No autorizado', statusCode: 401);
}

class NotFoundException extends AppException {
  const NotFoundException()
    : super(message: 'Recurso no encontrado', statusCode: 404);
}

class ServerException extends AppException {
  const ServerException({
    super.message = 'Error del servidor',
    super.statusCode = 500,
  });
}

class TimeoutException extends AppException {
  const TimeoutException() : super(message: 'Tiempo de espera agotado');
}

class CacheException extends AppException {
  const CacheException({super.message = 'Error de caché'});
}

class ValidationException extends AppException {
  const ValidationException({required super.message});
}
