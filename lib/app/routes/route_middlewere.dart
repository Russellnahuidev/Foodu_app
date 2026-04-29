import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/core/di/injection.dart';
import 'package:foodu_app/core/storage/secure_storage.dart';
import 'package:go_router/go_router.dart';

class RouteMiddleware {
  RouteMiddleware._();

  static final _publicRoutes = [
    RoutesNames.splash,
    RoutesNames.onboarding,
    RoutesNames.letsYouIn,
    RoutesNames.signIn,
    RoutesNames.signUp,
    RoutesNames.otpVerification,
    RoutesNames.fillProfile,
    RoutesNames.setLocation,
    RoutesNames.createPin,
    RoutesNames.fingerprint,
    RoutesNames.faceRecognition,
  ];

  static Future<String?> guard(_, GoRouterState state) async {
    final secureStorage = getIt<SecureStorage>();
    final token = await secureStorage.getToken();
    final isAuthenticated = token != null && token.isNotEmpty;
    final isPublicRoute = _publicRoutes.contains(state.matchedLocation);

    if (!isAuthenticated && !isPublicRoute) {
      return RoutesNames.signIn;
    }

    if (isAuthenticated &&
        isPublicRoute &&
        state.matchedLocation != RoutesNames.splash) {
      return RoutesNames.home;
    }

    return null;
  }
}
