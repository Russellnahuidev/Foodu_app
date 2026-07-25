import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CongratulationsDialog extends StatefulWidget {
  const CongratulationsDialog({super.key});

  @override
  State<CongratulationsDialog> createState() => _CongratulationsDialogState();
}

class _CongratulationsDialogState extends State<CongratulationsDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _loaderController;
  late Animation<double> _loaderFade;

  @override
  void initState() {
    super.initState();

    // Inicialización del controller para el loader
    _loaderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _loaderFade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _loaderController, curve: Curves.easeIn));

    // Iniciar animación del fade del loader
    _loaderController.forward();
  }

  @override
  void dispose() {
    _loaderController.dispose();
    super.dispose();
  }

  // Widget utilitario para crear los puntos decorativos
  Widget _buildDecorativeDot(double size, {Color? color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color:
            color ??
            AppColors.primary.withValues(
              alpha: 0.5,
            ), // Color principal con opacidad para los puntos secundarios
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Definimos el tamaño del avatar central para usarlo de referencia en el Stack
    const double avatarRadius = 65.0;
    const double avatarSize = avatarRadius * 2;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Area del Icono con Puntos Decorativos (Usando Stack)
            SizedBox(
              // Damos un espacio extra alrededor del avatar para los puntos
              width: avatarSize + 60,
              height: avatarSize + 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Punto grande superior izquierda
                  Positioned(top: 20, left: 20, child: _buildDecorativeDot(18)),

                  // Punto mediano central superior
                  Positioned(
                    top: 5,
                    left: (avatarSize + 60) / 2 - 5,
                    child: _buildDecorativeDot(10),
                  ),

                  // Punto mediano superior derecha
                  Positioned(
                    top: 30,
                    right: 15,
                    child: _buildDecorativeDot(14),
                  ),

                  // Punto pequeño izquierda central
                  Positioned(
                    top: (avatarSize + 60) / 2 - 15,
                    left: 0,
                    child: _buildDecorativeDot(8),
                  ),

                  // Punto grande izquierda inferior
                  Positioned(
                    bottom: 35,
                    left: 10,
                    child: _buildDecorativeDot(16),
                  ),

                  // Punto mediano inferior central-izquierda
                  Positioned(
                    bottom: 10,
                    left: (avatarSize + 60) / 2 - 40,
                    child: _buildDecorativeDot(12),
                  ),

                  // Punto pequeño derecha inferior
                  Positioned(
                    bottom: 25,
                    right: 10,
                    child: _buildDecorativeDot(8),
                  ),

                  // Punto mediano derecha central
                  Positioned(
                    top: (avatarSize + 60) / 2 - 10,
                    right: 0,
                    child: _buildDecorativeDot(10),
                  ),

                  Container(
                    width: avatarSize,
                    height: avatarSize,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24), // Ajustado el espaciado según Figma
            /// Title
            Text(
              AppStrings.dialogCongratulationTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 16),

            /// Description
            Text(
              AppStrings.dialogRecognitionDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.5, // Aumentado ligeramente el interlineado
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 32),

            /// Loader animado
            AnimatedBuilder(
              animation: _loaderController,
              builder: (_, _) => FadeTransition(
                opacity: _loaderFade,
                child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.primary,
                  size: AppDimensions.iconSizeXXXL,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
