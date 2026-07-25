import 'package:flutter/material.dart';
import 'package:foodu_app/app/themes/app_colors.dart';

class FaceRecognitionIcon extends StatelessWidget {
  const FaceRecognitionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        height: 350,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer Circle
            Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.15),
              ),
            ),

            // Middle Circle
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.25),
              ),
            ),

            // Inner Circle
            Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: const Icon(
                Icons.face_rounded,
                size: 100,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
