import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';
import 'package:foodu_app/core/storage/local_storage.dart';
import 'package:foodu_app/features/auth/presentation/pages/lets_you_in_page.dart';
import 'package:foodu_app/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:foodu_app/features/splash/presentation/widgets/splash_logo.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _loaderController;
  late Animation<double> _logoScale;
  late Animation<double> _logoFade;
  late Animation<double> _textFade;
  late Animation<Offset> _textSlide;
  late Animation<double> _loaderFade;

  @override
  void initState() {
    super.initState();

    _initAnimations();

    _startAnimation();
  }

  void _initAnimations() {
    _logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );

    _textController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _loaderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _logoScale = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _logoController, curve: Interval(0, 0.5)),
    );

    _textFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _textSlide = Tween<Offset>(
      begin: Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _loaderFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _loaderController, curve: Curves.easeIn));
  }

  // Secuencia de animaciones: logo -> texto -> loader
  Future<void> _startAnimation() async {
    await _logoController.forward();

    await _textController.forward();

    await _loaderController.forward();

    await _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final storage = LocalStorage();

    // Verificar onboarding
    final hasSeen = await storage.isOnboardingShown();

    if (!mounted) return;

    if (hasSeen) {
      /// Ir a LetsYouIn
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LetsYouInPage()),
      );
    } else {
      /// Mostrar Onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomePage()),
      );
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _loaderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                //Logo animado
                AnimatedBuilder(
                  animation: _logoController,
                  builder: (_, __) => FadeTransition(
                    opacity: _logoFade,
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: SplashLogo(),
                    ),
                  ),
                ),

                SizedBox(width: AppDimensions.spaceSM),

                //Texto animado
                AnimatedBuilder(
                  animation: _textController,
                  builder: (_, _) => FadeTransition(
                    opacity: _textFade,
                    child: SlideTransition(
                      position: _textSlide,
                      child: Text(
                        AppStrings.appName,
                        style: AppTextStyles.headlineLarge.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Spacer(flex: 3),

            //Loader animado
            Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.space56),
              child: AnimatedBuilder(
                animation: _loaderController,
                builder: (_, __) => FadeTransition(
                  opacity: _loaderFade,
                  child: LoadingAnimationWidget.hexagonDots(
                    color: AppColors.primary,
                    size: AppDimensions.iconSizeXXXL,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
