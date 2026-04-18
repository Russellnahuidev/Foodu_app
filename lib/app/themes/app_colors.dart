import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF1BAC4B);
  static const Color primary50 = Color(0xFFE8F8EE);
  static const Color primary100 = Color(0xFFC5EDCF);
  static const Color primary200 = Color(0xFF9EE0B0);
  static const Color primary300 = Color(0xFF72D38E);
  static const Color primary400 = Color(0xFF4AC874);
  static const Color primary500 = Color(0xFF1BAC4B);
  static const Color primary600 = Color(0xFF159B41);
  static const Color primary700 = Color(0xFF0D8735);
  static const Color primary800 = Color(0xFF076D29);
  static const Color primary900 = Color(0xFF02541C);

  // Secondary Colors / Dark Colors
  static const Color secondary = Color(0xFF333333);
  static const Color secondary50 = Color(0xFFEDEDED);
  static const Color secondary100 = Color(0xFFD6D6D6);
  static const Color secondary200 = Color(0xFFBFBFBF);
  static const Color secondary300 = Color(0xFFA8A8A8);
  static const Color secondary400 = Color(0xFF919191);
  static const Color secondary500 = Color(0xFF7A7A7A);
  static const Color secondary600 = Color(0xFF636363);
  static const Color secondary700 = Color(0xFF4C4C4C);
  static const Color secondary800 = Color(0xFF353535);
  static const Color secondary900 = Color(0xFF1E1E1E);

  // Accent Colors / Yellow Orange
  static const Color accent = Color(0xFFFFBE00);
  static const Color accentLight = Color(0xFFFFF3CC);
  static const Color accentDark = Color(0xFFE6A800);

  // Success Colors
  static const Color success = Color(0xFF28A745);
  static const Color success50 = Color(0xFFE6F4EA);
  static const Color success100 = Color(0xFFBFF0C2);
  static const Color success200 = Color(0xFF99E9A8);
  static const Color success300 = Color(0xFF77D68A);
  static const Color success400 = Color(0xFF55C36C);
  static const Color success500 = Color(0xFF28A745);
  static const Color success600 = Color(0xFF218838);
  static const Color success700 = Color(0xFF1C7432);
  static const Color success800 = Color(0xFF166229);
  static const Color success900 = Color(0xFF114D21);

  // Error Colors
  static const Color error = Color(0xFFFF4B4B);
  static const Color error50 = Color(0xFFFFECEC);
  static const Color error100 = Color(0xFFFFCCCC);
  static const Color error500 = Color(0xFFFF4B4B);
  static const Color error700 = Color(0xFFCC2020);

  // Warning Colors
  static const Color warning = Color(0xFFFFBE00);
  static const Color warning50 = Color(0xFFFFF8E1);
  static const Color warning500 = Color(0xFFFFBE00);
  static const Color warning700 = Color(0xFFE6A800);

  // Info Colors
  static const Color info = Color(0xFF2196F3);
  static const Color info50 = Color(0xFFE3F2FD);
  static const Color info500 = Color(0xFF2196F3);
  static const Color info700 = Color(0xFF1976D2);

  // Neutral Colors / Grays
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // Background Colors
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color scaffoldLight = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textDisabled = Color(0xFFE0E0E0);
  static const Color textLight = Color(0xFFFFFFFF);

  // Border Colors
  static const Color borderLight = Color(0xFFEEEEEE);
  static const Color borderDark = Color(0xFF424242);
  static const Color borderFocus = Color(0xFF1BAC4B);

  // Overlay Colors
  static const Color overlayLight = Color(0x1A000000);
  static const Color overlayDark = Color(0x80000000);
  static const Color overlayBlack = Color(0xB3000000);

  // Shadow Colors
  static const Color shadowLight = Color(0x0F000000);
  static const Color shadowMedium = Color(0x1A000000);

  // Star Colors / Ratings
  static const Color starFilled = Color(0xFFFFBE00);
  static const Color starEmpty = Color(0xFFE0E0E0);

  // Social Colors
  static const Color facebook = Color(0xFF1877F2);
  static const Color google = Color(0xFFDB4437);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color instagram = Color(0xFFE43023);
  static const Color youtube = Color(0xFFFF4400);
  static const Color linkedin = Color(0xFF0077B5);
  static const Color pinterest = Color(0xFFC22626);
  static const Color snapchat = Color(0xFFFF4600);
  static const Color telegram = Color(0xFF0077B5);
  static const Color whatsapp = Color(0xFF25D366);
  static const Color apple = Color(0xFF000000);

  //Order Status Colors
  static const Color statusPending = Color(0xFFFFBE00);
  static const Color statusProcessing = Color(0xFF2196F3);
  static const Color statusDelivering = Color(0xFF9C27B0);
  static const Color statusDelivered = Color(0xFF1BAC4B);
  static const Color statusCancelled = Color(0xFFFF4B4B);

  // Gradient Colors
  static const List<Color> gradientPrimary = [
    Color(0xFF1BAC4B),
    Color(0xFF4AC874),
  ];
  static const List<Color> gradientSecondary = [
    Color(0xFF333333),
    Color(0xFF616161),
  ];
  static const List<Color> gradientTertiary = [
    Color(0xFF000000),
    Color(0xFF333333),
  ];
  static const List<Color> gradientQuaternary = [
    Color(0xFF2196F3),
    Color(0xFF64B5F6),
  ];

  // Map Colors
  static const Color mapRoute = Color(0xFF1BAC4B);
  static const Color mapOrigin = Color(0xFF1BAC4B);
  static const Color mapDestination = Color(0xFFFF4B4B);

  // Transparent Colors
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
