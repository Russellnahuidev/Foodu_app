import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/shared/widgets/inputs/otp_digit_field.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';
import 'package:go_router/go_router.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({super.key});

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  final c1 = TextEditingController();
  final c2 = TextEditingController();
  final c3 = TextEditingController();
  final c4 = TextEditingController();

  final f1 = FocusNode();
  final f2 = FocusNode();
  final f3 = FocusNode();
  final f4 = FocusNode();

  bool get isPinComplete =>
      c1.text.isNotEmpty &&
      c2.text.isNotEmpty &&
      c3.text.isNotEmpty &&
      c4.text.isNotEmpty;

  void _onChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.createPinTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.space),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.space64),
              // Descripcion
              Text(
                AppStrings.createPinDescription,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: AppDimensions.space64),

              // PIN INPUT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  OtpDigitField(
                    controller: c1,
                    focusNode: f1,
                    nextFocus: f2,
                    obscureText: true,
                    onChanged: _onChanged,
                  ),

                  OtpDigitField(
                    controller: c2,
                    focusNode: f2,
                    previousFocus: f1,
                    nextFocus: f3,
                    obscureText: true,
                    onChanged: _onChanged,
                  ),

                  OtpDigitField(
                    controller: c3,
                    focusNode: f3,
                    previousFocus: f2,
                    nextFocus: f4,
                    obscureText: true,
                    onChanged: _onChanged,
                  ),

                  OtpDigitField(
                    controller: c4,
                    focusNode: f4,
                    previousFocus: f3,
                    obscureText: true,
                    onChanged: _onChanged,
                  ),
                ],
              ),

              SizedBox(height: AppDimensions.space64),

              // Verify Button
              PrimaryButton(
                label: AppStrings.continueButton,
                onPressed: () {
                  // Luego conectamos con Bloc
                  context.push(RoutesNames.fingerprint);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
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
}
