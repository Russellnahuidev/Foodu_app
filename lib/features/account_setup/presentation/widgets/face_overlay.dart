import 'package:flutter/material.dart';
import 'dart:math';
import 'package:foodu_app/app/themes/app_colors.dart';

class FaceOverlay extends StatefulWidget {
  const FaceOverlay({super.key});

  @override
  State<FaceOverlay> createState() => _FaceOverlayState();
}

class _FaceOverlayState extends State<FaceOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, _) {
        return CustomPaint(
          painter: FaceOverlayPainter(progress: controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class FaceOverlayPainter extends CustomPainter {
  final double progress;

  FaceOverlayPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.7,
      height: size.height * 0.5,
    );

    // Glow breathing (tipo Face ID)
    final glow = 0.6 + 0.4 * sin(progress * 2 * pi);

    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: glow)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const L = 70.0;

    void draw(Path p) => canvas.drawPath(p, paint);

    final tl = rect.topLeft;
    draw(
      Path()
        ..moveTo(tl.dx, tl.dy + L)
        ..quadraticBezierTo(tl.dx, tl.dy, tl.dx + L, tl.dy),
    );

    final tr = rect.topRight;
    draw(
      Path()
        ..moveTo(tr.dx - L, tr.dy)
        ..quadraticBezierTo(tr.dx, tr.dy, tr.dx, tr.dy + L),
    );

    final bl = rect.bottomLeft;
    draw(
      Path()
        ..moveTo(bl.dx, bl.dy - L)
        ..quadraticBezierTo(bl.dx, bl.dy, bl.dx + L, bl.dy),
    );

    final br = rect.bottomRight;
    draw(
      Path()
        ..moveTo(br.dx - L, br.dy)
        ..quadraticBezierTo(br.dx, br.dy, br.dx, br.dy - L),
    );

    // Scan line (difuminada, no dura)
    final scanY = rect.top + rect.height * progress;

    final gradient = LinearGradient(
      colors: [
        AppColors.primary.withValues(alpha: 0),
        AppColors.primary.withValues(alpha: 0.7),
        AppColors.primary.withValues(alpha: 0),
      ],
      stops: const [0, 0.5, 1],
    );

    final scanRect = Rect.fromLTWH(rect.left, scanY - 25, rect.width, 50);

    final scanPaint = Paint()..shader = gradient.createShader(scanRect);

    canvas.drawRect(scanRect, scanPaint);

    // Puntos con desfase (CLAVE)
    final basePoints = [
      Offset(rect.center.dx - 60, rect.center.dy - 80),
      Offset(rect.center.dx + 50, rect.center.dy - 70),
      Offset(rect.center.dx - 80, rect.center.dy - 10),
      Offset(rect.center.dx + 70, rect.center.dy - 5),
      Offset(rect.center.dx - 50, rect.center.dy + 50),
      Offset(rect.center.dx + 40, rect.center.dy + 60),
      Offset(rect.center.dx, rect.center.dy - 20),
      Offset(rect.center.dx - 10, rect.center.dy + 10),
      Offset(rect.center.dx + 15, rect.center.dy + 30),
    ];

    final sizes = [3.0, 4.5, 3.5, 5.0, 4.0, 3.5, 5.5, 3.0, 4.2];

    for (int i = 0; i < basePoints.length; i++) {
      // desfase más natural (no lineal)
      final phase = (progress * 2 + i * 0.27) % 1;

      // animación tipo breathing
      final opacity = 0.3 + 0.7 * (0.5 + 0.5 * sin(phase * 2 * pi));

      // ligera escala (esto cambia todo visualmente)
      final scale = 0.8 + 0.4 * sin(phase * 2 * pi);

      final paint = Paint()..color = Colors.white.withValues(alpha: opacity);

      canvas.drawCircle(basePoints[i], sizes[i] * scale, paint);
    }
  }

  @override
  bool shouldRepaint(covariant FaceOverlayPainter oldDelegate) => true;
}
