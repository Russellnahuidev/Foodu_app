import 'package:flutter/material.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/features/account_setup/presentation/pages/create_pin_page.dart';
import 'package:foodu_app/features/account_setup/presentation/pages/fill_profile_page.dart';
import 'package:foodu_app/features/account_setup/presentation/pages/fingerprint_page.dart';
import 'package:foodu_app/features/account_setup/presentation/pages/set_location_page.dart';
import 'package:foodu_app/features/auth/presentation/pages/lets_you_in_page.dart';
import 'package:foodu_app/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:foodu_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:foodu_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:foodu_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:foodu_app/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:foodu_app/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesNames.splash,
    routes: [
      GoRoute(
        path: RoutesNames.splash,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: RoutesNames.welcome,
        builder: (context, state) => WelcomePage(),
      ),
      GoRoute(
        path: RoutesNames.onboarding,
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        path: RoutesNames.letsYouIn,
        builder: (context, state) => LetsYouInPage(),
      ),
      GoRoute(
        path: RoutesNames.signIn,
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: RoutesNames.signUp,
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: RoutesNames.otpVerification,
        builder: (context, state) => OtpVerificationPage(),
      ),
      GoRoute(
        path: RoutesNames.fillProfile,
        builder: (context, state) => FillProfilePage(),
      ),
      GoRoute(
        path: RoutesNames.setLocation,
        builder: (context, state) => SetLocationPage(),
      ),
      GoRoute(
        path: RoutesNames.createPin,
        builder: (context, state) => CreatePinPage(),
      ),
      GoRoute(
        path: RoutesNames.fingerprint,
        builder: (context, state) => FingerprintPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Ruta no encontrada: ${state.error}')),
    ),
  );
}
