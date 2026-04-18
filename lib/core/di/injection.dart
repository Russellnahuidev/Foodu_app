import 'package:get_it/get_it.dart';
import '../storage/secure_storage.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  /// Core dependencies

  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
}
