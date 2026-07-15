import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/themes/app_colors.dart';

class CongratulationsDialog extends StatelessWidget {
  const CongratulationsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.cardPadding),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Icon
            CircleAvatar(
              radius: 45,
              backgroundColor: AppColors.primary,

              child: const Icon(Icons.person, size: 40, color: Colors.white),
            ),

            const SizedBox(height: AppDimensions.spaceXL),

            /// Title
            Text(
              "Congratulations!",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// Description
            Text(
              "Your account is ready to use. "
              "You will be redirected to the Home page in a few seconds.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: AppDimensions.spaceXL),

            /// Loading dots
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
