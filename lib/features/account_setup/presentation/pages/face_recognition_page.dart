import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/app/themes/text_styles.dart';
import 'package:foodu_app/features/account_setup/presentation/widgets/face_recognition_icon.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';
import 'package:foodu_app/shared/widgets/buttons/secondary_button.dart';
import 'package:go_router/go_router.dart';

class FaceRecognitionPage extends StatefulWidget {
  const FaceRecognitionPage({super.key});

  @override
  State<FaceRecognitionPage> createState() => _FaceRecognitionPageState();
}

class _FaceRecognitionPageState extends State<FaceRecognitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
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
                      // Espaciador flexible superior
                      const Spacer(flex: 1),

                      // Title
                      Text(
                        AppStrings.faceRecognitionTitle,
                        style: AppTextStyles.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppDimensions.space),

                      // Description
                      Text(
                        AppStrings.faceRecognitionDescription,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),

                      // Espaciador flexible hacia el icono
                      const Spacer(flex: 2),

                      // Face Icon
                      const Center(child: FaceRecognitionIcon()),

                      // Espaciador flexible inferior al icono
                      const Spacer(flex: 3),

                      // Botones de acción
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                context.push(RoutesNames.faceScanning);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimensions.spaceSM),
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
