import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/app/themes/text_styles.dart';
import 'package:foodu_app/shared/widgets/inputs/otp_digit_field.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';
import 'package:go_router/go_router.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  // Controllers OTP
  final c1 = TextEditingController();
  final c2 = TextEditingController();
  final c3 = TextEditingController();
  final c4 = TextEditingController();

  // Focus Nodes
  final f1 = FocusNode();
  final f2 = FocusNode();
  final f3 = FocusNode();
  final f4 = FocusNode();

  // Timer
  Timer? timer;
  int secondsRemaining = 55;
  bool canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    // Detectar pegado de  OTP Completo

    c1.addListener(() {
      if (c1.text.length > 1) {
        handlePaste(c1.text);
      }
    });
  }

  // Cuenta atras del teimpo
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining == 0) {
        setState(() {
          canResend = true;
        });
        timer.cancel();
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  // Pegar OTP Completo
  void handlePaste(String value) {
    if (value.length == 4) {
      c1.text = value[0];
      c2.text = value[1];
      c3.text = value[2];
      c4.text = value[3];

      f4.requestFocus();

      verifyIfComplete();
    }
  }

  // Verificar si OTP completo
  void verifyIfComplete() {
    if (c1.text.isNotEmpty &&
        c2.text.isNotEmpty &&
        c3.text.isNotEmpty &&
        c4.text.isNotEmpty) {
      FocusScope.of(context).unfocus();

      final otp = c1.text + c2.text + c3.text + c4.text;

      debugPrint("OTP: $otp");

      // Aquí luego conectamos Bloc/API
    }
  }

  /// Reenviar código
  void resendCode() {
    setState(() {
      secondsRemaining = 55;
      canResend = false;
    });

    startTimer();

    /// Aquí luego llamamos API resend
    debugPrint("Resend OTP");
  }

  @override
  void dispose() {
    timer?.cancel();

    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();

    f1.dispose();
    f2.dispose();
    f3.dispose();
    f4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.otpVerificationTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.space),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppDimensions.space64),
              // Titulo
              Text(
                AppStrings.otpCodeHint,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: AppDimensions.spaceXL),

              // Numero
              Text(
                '+51 9** *** *99',
                textAlign: TextAlign.center,
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),

              SizedBox(height: AppDimensions.spaceXL),

              /// OTP Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpDigitField(
                    controller: c1,
                    focusNode: f1,
                    nextFocus: f2,
                    onChanged: verifyIfComplete,
                  ),

                  OtpDigitField(
                    controller: c2,
                    focusNode: f2,
                    nextFocus: f3,
                    previousFocus: f1,
                    onChanged: verifyIfComplete,
                  ),

                  OtpDigitField(
                    controller: c3,
                    focusNode: f3,
                    nextFocus: f4,
                    previousFocus: f2,
                    onChanged: verifyIfComplete,
                  ),

                  OtpDigitField(
                    controller: c4,
                    focusNode: f4,
                    previousFocus: f3,
                    onChanged: verifyIfComplete,
                  ),
                ],
              ),

              SizedBox(height: AppDimensions.spaceXL),

              // Resend Timer
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),

                child: canResend
                    ? TextButton(
                        key: const ValueKey("resend"),

                        onPressed: resendCode,

                        child: Text(
                          AppStrings.resendCode,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      )
                    : RichText(
                        key: ValueKey("timer"),
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                          children: [
                            TextSpan(text: AppStrings.resendCodeIn),

                            TextSpan(
                              text: "$secondsRemaining",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            TextSpan(text: AppStrings.resendCodeInSeconds),
                          ],
                        ),
                      ),
              ),

              SizedBox(height: AppDimensions.space64),

              // Verify Button
              PrimaryButton(
                label: AppStrings.otpVerificationButton,
                onPressed: () {
                  // Luego conectamos con Bloc
                  verifyIfComplete();
                  context.push(RoutesNames.fillProfile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
