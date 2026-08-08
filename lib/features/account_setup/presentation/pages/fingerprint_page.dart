import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/features/account_setup/presentation/widgets/biometric_icon.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';
import 'package:foodu_app/shared/widgets/buttons/secondary_button.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

class FingerprintPage extends StatefulWidget {
  const FingerprintPage({super.key});

  @override
  State<FingerprintPage> createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.fingerprintTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.space),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(flex: 1),

                      SizedBox(height: AppDimensions.space),
                      // Descripcion
                      Text(
                        AppStrings.fingerprintDescription,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),

                      /// Fingerprint Icon
                      const Spacer(flex: 2),

                      BiometricIcon(icon: PhosphorIcons.fingerprint()),

                      const Spacer(flex: 2),

                      /// Instruction Text
                      Text(
                        AppStrings.fingerprintInstruction,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),

                      const Spacer(flex: 3),

                      /// Botones de acción
                      Row(
                        children: [
                          // Skip Button
                          Expanded(
                            child: SecondaryButton(
                              label: AppStrings.skipButton,
                              onPressed: () {
                                // Skip biometric
                              },
                            ),
                          ),
                          SizedBox(width: AppDimensions.spaceMD),
                          // Continue Button
                          Expanded(
                            child: PrimaryButton(
                              label: AppStrings.continueButton,
                              onPressed: () {
                                // Navigate to FaceRecognitionPage
                                context.push(RoutesNames.faceRecognition);
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: AppDimensions.space),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
