abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Error de red'});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = 'Error del servidor'});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message = 'No autorizado'});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = 'Recurso no encontrado'});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Error de caché'});
}

class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({super.message = 'Tiempo de espera agotado'});
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'Error desconocido'});
}
