import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:foodu_app/features/auth/presentation/widgets/auth_header_image.dart';
import 'package:foodu_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:foodu_app/features/auth/presentation/widgets/country_phone_field.dart';
import 'package:foodu_app/features/auth/presentation/widgets/or_divider.dart';
import 'package:foodu_app/features/auth/presentation/widgets/remember_me_checkbox.dart';
import 'package:foodu_app/features/auth/presentation/widgets/social_button.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// Controllers
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

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
          onPressed: () => context.pop(),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.space),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimensions.spaceXXL),

              // Imagen superior
              SizedBox(height: 180, child: const AuthHeaderImage()),

              SizedBox(height: AppDimensions.spaceXS),
              //Titulo
              Center(
                child: Text(
                  AppStrings.signUpTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              SizedBox(height: AppDimensions.spaceXXXL),

              // Formulario de Telefono
              CountryPhoneField(controller: phoneController),

              SizedBox(height: AppDimensions.space),

              // Formulario de email
              AuthTextField(
                hintText: AppStrings.emailHint,
                icon: Icons.email_rounded,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: AppDimensions.space),

              // Formulario de nombre
              AuthTextField(
                hintText: AppStrings.nameHint,
                icon: Icons.person_rounded,
                controller: nameController,
              ),

              SizedBox(height: AppDimensions.space),

              /// Recordar sesion
              RememberMeCheckbox(
                value: rememberMe,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value ?? true;
                  });
                },
              ),

              SizedBox(height: AppDimensions.space),

              // Boton de registro
              PrimaryButton(
                label: AppStrings.signUpButton,
                onPressed: () {
                  // Luego conectaremos con Bloc
                },
              ),

              SizedBox(height: AppDimensions.spaceXXL),

              // Divición
              OrDivider(text: AppStrings.orContinueWith),

              SizedBox(height: AppDimensions.spaceXXL),

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

              SizedBox(height: AppDimensions.spaceXL),

              // Ya tengo cuenta
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAnAccount,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isDark ? AppColors.grey300 : AppColors.grey500,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      context.push(RoutesNames.signIn);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: Text(AppStrings.signInButton),
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
