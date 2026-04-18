import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/themes/text_styles.dart';
import 'package:foodu_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:foodu_app/features/onboarding/presentation/widget/onboarding_background.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel item;

  const OnboardingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnboardingBackground(),

        //Conten
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.spaceXL),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.spaceXXXL),

              // Image
              Expanded(child: Image.asset(item.image, fit: BoxFit.contain)),

              SizedBox(height: AppDimensions.spaceXL),

              // Title
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.headlineLarge.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: AppDimensions.spaceMD),

              // Descripción
              Text(
                item.description,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  height: 1.5,
                ),
              ),
              SizedBox(height: AppDimensions.spaceXXXL),
            ],
          ),
        ),
      ],
    );
  }
}
