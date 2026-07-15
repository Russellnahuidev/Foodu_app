import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
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

    // Simula verificación
    Future.delayed(const Duration(seconds: 3), () {
      _showSuccessDialog();
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (_) => const CongratulationsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen fondo
          Positioned.fill(
            child: Image.asset("assets/images/face.png", fit: BoxFit.cover),
          ),

          // Overlay
          const FaceOverlay(),

          // Bottom info
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,

            child: Column(
              children: [
                // Percentage
                Text(
                  "100%",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Verifying your face...",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                ),

                const SizedBox(height: AppDimensions.spaceXL),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ],
      ),
    );
  }
}
