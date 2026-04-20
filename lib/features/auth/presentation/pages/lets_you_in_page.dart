import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';
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
          padding: EdgeInsets.all(AppDimensions.cardPadding),
          child: Column(
            children: [
              // Imagen superior
              Expanded(
                flex: 4,
                child: Center(
                  child: Image.asset(
                    "assets/images/lets_you_in.png",
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
                text: AppStrings.continueWithFacebook,
                iconPath: "assets/images/facebook.png",
                onTap: () {},
              ),

              SizedBox(height: AppDimensions.space),

              // Botón Google
              SocialLoginButton(
                text: AppStrings.continueWithGoogle,
                iconPath: "assets/images/google.png",
                onTap: () {},
              ),

              SizedBox(height: AppDimensions.space),

              // Botón Apple
              SocialLoginButton(
                text: AppStrings.continueWithApple,
                iconPath: isDark
                    ? "assets/images/apple_dark.png"
                    : "assets/images/apple.png",
                onTap: () {},
              ),

              SizedBox(height: AppDimensions.space),

              // Divider OR
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: isDark ? AppColors.grey800 : AppColors.grey300,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.space,
                    ),
                    child: Text(AppStrings.or, style: AppTextStyles.bodyMedium),
                  ),

                  Expanded(
                    child: Divider(
                      color: isDark ? AppColors.grey800 : AppColors.grey300,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppDimensions.space),

              // Botón Phone Number
              PrimaryButton(
                label: AppStrings.continueWithNumber,
                onPressed: () {
                  // Luego navegaremos a Login
                },
              ),

              SizedBox(height: AppDimensions.space),

              // texto si no tienes cuente y boton de registro
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
                      // Luego navegaremos a Sign Up
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: Text(AppStrings.signUp),
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
