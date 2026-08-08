import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/features/account_setup/presentation/widgets/face_overlay.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';
import 'package:foodu_app/shared/widgets/buttons/secondary_button.dart';
import 'package:foodu_app/shared/widgets/dialogs/congratulations_dialog.dart';
import 'package:go_router/go_router.dart';

class FaceScanningPage extends StatefulWidget {
  const FaceScanningPage({super.key});

  @override
  State<FaceScanningPage> createState() => _FaceScanningPageState();
}

class _FaceScanningPageState extends State<FaceScanningPage> {
  @override
  void initState() {
    super.initState();

    // Simula verificación segura
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _showSuccessDialog();
      }
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (_) => const CongratulationsDialog(),
    );
    // 2. Espera unos segundos y navega al Home
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(RoutesNames.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // Fondo oscuro por si la imagen tarda en cargar
      body: Stack(
        children: [
          // 1. Imagen de fondo full screen
          Positioned.fill(
            child: Image.asset("assets/images/face.png", fit: BoxFit.cover),
          ),

          // 2. Overlay marco / puntos de escaneo
          const FaceOverlay(),

          // 3. Encabezado Flotante (Botón Atrás, Título y Descripción)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.space,
                  vertical: AppDimensions.spaceSM,
                ),
                child: Column(
                  children: [
                    // Botón Atrás alineado a la izquierda
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                        ),
                        onPressed: () => context.pop(),
                      ),
                    ),

                    SizedBox(height: AppDimensions.spaceSM),

                    // Título
                    Text(
                      AppStrings.faceRecognitionTitle,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: AppDimensions.spaceSM),

                    // Subtítulo / Descripción
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.space,
                      ),
                      child: Text(
                        AppStrings.faceRecognitionDescription,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 4. Panel Inferior Flotante (Porcentaje, Estado y Botones)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.space),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Percentage Text
                    Text(
                      AppStrings.faceRecognitionPercentage,
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    SizedBox(height: AppDimensions.spaceSM),

                    // Status Text
                    Text(
                      AppStrings.faceRecognitionLoading,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                    ),

                    const SizedBox(height: AppDimensions.spaceXL),

                    // Buttons
                    Row(
                      children: [
                        // Skip Button
                        Expanded(
                          child: SecondaryButton(
                            label: AppStrings.skipButton,
                            onPressed: () {
                              // Skip biometric
                              _showSuccessDialog();
                            },
                          ),
                        ),
                        SizedBox(width: AppDimensions.spaceMD),
                        // Continue Button
                        Expanded(
                          child: PrimaryButton(
                            label: AppStrings.continueButton,
                            onPressed: () {
                              _showSuccessDialog();
                              //
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
