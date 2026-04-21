import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:foodu_app/features/auth/presentation/widgets/or_divider.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';
import 'package:foodu_app/shared/widgets/buttons/social_login_button.dart';

class LetsYouInPage extends StatelessWidget {
  const LetsYouInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.space),
          child: Column(
            children: [
              // Imagen superior
              SizedBox(
                child: Center(
                  child: Image.asset(
                    "assets/images/lets_you_in.png",
                    width: 400,
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              //Texto
              Text(
                AppStrings.letsYouInTitle,
                style: AppTextStyles.headlineExtraLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.space),

              // Botón Facebook
              SocialLoginButton(
                text: AppStrings.facebookLoginButton,
                iconPath: 'assets/images/facebook.png',
                onTap: () {},
              ),

              SizedBox(height: AppDimensions.space),

              // Botón Google
              SocialLoginButton(
                text: AppStrings.googleLoginButton,
                iconPath: 'assets/images/google.png',
                onTap: () {},
              ),

              SizedBox(height: AppDimensions.space),

              // Botón Apple
              SocialLoginButton(
                text: AppStrings.appleLoginButton,
                iconPath: isDark
                    ? 'assets/images/apple_dark.png'
                    : 'assets/images/apple.png',
                onTap: () {},
              ),

              SizedBox(height: AppDimensions.space),

              // Divivion O
              OrDivider(text: AppStrings.or),

              SizedBox(height: AppDimensions.space),

              // Botón Phone Number
              PrimaryButton(
                label: AppStrings.continueWithNumber,
                onPressed: () {
                  // Luego navegaremos a Login
                },
              ),

              SizedBox(height: AppDimensions.space),

              // texto si no tienes cuenta y boton de registro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAnAccount,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark ? AppColors.grey300 : AppColors.grey500,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      context.push(RoutesNames.signUp);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: Text(AppStrings.signUpButton),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
