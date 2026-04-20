import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/core/storage/local_storage.dart';
import 'package:foodu_app/features/auth/presentation/pages/lets_you_in_page.dart';
import 'package:foodu_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:foodu_app/features/onboarding/presentation/widget/onboarding_indicator.dart';
import 'package:foodu_app/features/onboarding/presentation/widget/onboarding_item.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  int _currentIndex = 0;

  late final List<OnboardingModel> _items;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _items = [
      OnboardingModel(
        image: 'assets/images/onboarding1.png',
        title: AppStrings.onboardingTitle1,
        description: AppStrings.onboardingDesc1,
      ),
      OnboardingModel(
        image: 'assets/images/onboarding2.png',
        title: AppStrings.onboardingTitle2,
        description: AppStrings.onboardingDesc2,
      ),
      OnboardingModel(
        image: 'assets/images/onboarding3.png',
        title: AppStrings.onboardingTitle3,
        description: AppStrings.onboardingDesc3,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      _goToLogin();
    }
  }

  void _skip() {
    _goToLogin();
  }

  void _goToLogin() async {
    final storage = LocalStorage();

    await storage.setOnboardingShown();

    if (!mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => LetsYouInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spaceXL,
                vertical: AppDimensions.spaceMD,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: _currentIndex != _items.length - 1
                    ? TextButton(
                        onPressed: _skip,
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: Text(AppStrings.onboardingSkip),
                      )
                    : const SizedBox(),
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _items.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingItem(item: _items[index]);
                },
              ),
            ),

            // Onboarding indicator
            OnboardingIndicator(
              currentIndex: _currentIndex,
              total: _items.length,
            ),

            SizedBox(height: AppDimensions.spaceXXXL),

            // Button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spaceXL,
              ),
              child: PrimaryButton(
                label: _currentIndex == _items.length - 1
                    ? AppStrings.onboardingGetStarted
                    : AppStrings.onboardingNext,
                onPressed: _nextPage,
              ),
            ),
            SizedBox(height: AppDimensions.spaceXL),
          ],
        ),
      ),
    );
  }
}
