import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';
import 'package:foodu_app/features/auth/presentation/widgets/auth_header_image.dart';
import 'package:foodu_app/features/auth/presentation/widgets/country_phone_field.dart';
import 'package:foodu_app/features/auth/presentation/widgets/or_divider.dart';
import 'package:foodu_app/features/auth/presentation/widgets/remember_me_checkbox.dart';
import 'package:foodu_app/features/auth/presentation/widgets/social_button.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // Controllers
  final phoneController = TextEditingController();

  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(RoutesNames.letsYouIn);
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.space),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.spaceXXL),

              // Imagen superior
              SizedBox(height: 180, child: AuthHeaderImage()),

              SizedBox(height: AppDimensions.space),

              // Titulo
              Text(
                AppStrings.signInTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              SizedBox(height: AppDimensions.spaceXXXL),

              // Formulario de numero
              CountryPhoneField(controller: phoneController),

              SizedBox(height: AppDimensions.spaceXL),

              // Recordar sesion
              RememberMeCheckbox(
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value ?? false;
                  });
                },
              ),
              SizedBox(height: AppDimensions.spaceXL),

              // Botton de inicio de sesion
              PrimaryButton(
                label: AppStrings.signInButton,
                onPressed: () {
                  //luego se realziará la implementación
                  context.push(RoutesNames.otpVerification);
                },
              ),

              SizedBox(height: AppDimensions.space48),

              // Divición
              OrDivider(text: AppStrings.orContinueWith),

              SizedBox(height: AppDimensions.space56),

              // Row de botones de redes sosiales
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(
                    imagePath: 'assets/images/facebook.png',
                    onTap: () {},
                  ),

                  SizedBox(width: AppDimensions.space),

                  SocialButton(
                    imagePath: 'assets/images/google.png',
                    onTap: () {},
                  ),

                  SizedBox(width: AppDimensions.space),

                  SocialButton(
                    imagePath: isDark
                        ? 'assets/images/apple_dark.png'
                        : 'assets/images/apple.png',
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: AppDimensions.space64),

              // No tienes una cuenta
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
