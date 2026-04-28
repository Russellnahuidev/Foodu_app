import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';
import 'package:foodu_app/shared/widgets/inputs/app_text_field.dart';

class LocationBottomPanel extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onUseCurrentLocation;
  final VoidCallback onContinue;

  const LocationBottomPanel({
    super.key,
    required this.controller,
    required this.onUseCurrentLocation,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,

      child: Container(
        padding: EdgeInsets.all(AppDimensions.cardPadding),

        decoration: BoxDecoration(
          color: theme.cardColor,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.borderRadiusXL),

            topRight: Radius.circular(AppDimensions.borderRadiusXL),
          ),

          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            SizedBox(height: AppDimensions.spaceXXL),

            Text(AppStrings.setLocation, style: theme.textTheme.titleMedium),

            SizedBox(height: AppDimensions.spaceXXL),

            // CAMPO
            AppTextField(
              hintText: AppStrings.setLocationHint,

              controller: controller,

              suffixIcon: Icons.location_on_outlined,

              readOnly: true,

              onSuffixTap: onUseCurrentLocation,
            ),

            SizedBox(height: AppDimensions.spaceXXL),

            // BOTÓN
            PrimaryButton(
              label: AppStrings.continueButton,
              onPressed: onContinue,
            ),

            SizedBox(height: AppDimensions.spaceXXL),
          ],
        ),
      ),
    );
  }
}
