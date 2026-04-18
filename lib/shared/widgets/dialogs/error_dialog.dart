import 'package:flutter/material.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonLabel;
  final VoidCallback? onPressed;

  const ErrorDialog({
    super.key,
    this.title = '¡Algo salió mal!',
    required this.message,
    this.buttonLabel = 'Entendido',
    this.onPressed,
  });

  static void show(
    BuildContext context, {
    String title = '¡Algo salió mal!',
    required String message,
    String buttonLabel = 'Entendido',
    VoidCallback? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (_) => ErrorDialog(
        title: title,
        message: message,
        buttonLabel: buttonLabel,
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.error50,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('⚠️', style: TextStyle(fontSize: 30)),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onPressed?.call();
              },
              child: Text(buttonLabel),
            ),
          ),
        ),
      ],
    );
  }
}
