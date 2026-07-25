import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/routes/routes_names.dart';
import 'package:foodu_app/core/utils/app_date_utils.dart';
import 'package:foodu_app/features/account_setup/presentation/widgets/gender_dropdown.dart';
import 'package:foodu_app/features/account_setup/presentation/widgets/profile_avatar_picker.dart';
import 'package:foodu_app/shared/widgets/inputs/app_country_phone_field.dart';
import 'package:foodu_app/shared/widgets/buttons/primary_button.dart';
import 'package:foodu_app/shared/widgets/inputs/app_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class FillProfilePage extends StatefulWidget {
  const FillProfilePage({super.key});

  @override
  State<FillProfilePage> createState() => _FillProfilePageState();
}

class _FillProfilePageState extends State<FillProfilePage> {
  final fullNameController = TextEditingController();
  final nickNameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  String? gender;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.fillProfileTitle,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.space),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      SizedBox(height: AppDimensions.space),

                      // Avatar Picker
                      ProfileAvatarPicker(
                        imageFile: _selectedImage,
                        onTap: _showImageSourceOptions,
                      ),

                      SizedBox(height: AppDimensions.spaceXL),

                      // Nombre completo
                      AppTextField(
                        hintText: AppStrings.nameHint,
                        controller: fullNameController,
                      ),

                      SizedBox(height: AppDimensions.space),

                      // Apodo / Alias
                      AppTextField(
                        hintText: AppStrings.nicknameHint,
                        controller: nickNameController,
                      ),

                      SizedBox(height: AppDimensions.space),

                      // Fecha de nacimiento
                      AppTextField(
                        hintText: AppStrings.dobHint,
                        controller: dobController,
                        suffixIcon: Icons.calendar_today_outlined,
                        readOnly: true,
                        onTap: _selectDate,
                        onSuffixTap: _selectDate,
                      ),

                      SizedBox(height: AppDimensions.space),

                      // Correo Electrónico
                      AppTextField(
                        hintText: AppStrings.emailHint,
                        suffixIcon: Icons.email_outlined,
                        controller: emailController,
                      ),

                      SizedBox(height: AppDimensions.space),

                      // Teléfono con País
                      AppCountryPhoneField(controller: phoneController),

                      SizedBox(height: AppDimensions.space),

                      // Género Dropdown
                      GenderDropdown(
                        value: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),

                      // Empuja el botón automáticamente hacia el fondo
                      const Spacer(),

                      SizedBox(height: AppDimensions.space),

                      // Botón continuar fijado abajo
                      PrimaryButton(
                        label: AppStrings.continueButton,
                        onPressed: () {
                          context.push(RoutesNames.setLocation);
                        },
                      ),

                      SizedBox(height: AppDimensions.space),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    nickNameController.dispose();
    dobController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _showImageSourceOptions() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate() async {
    FocusScope.of(context).unfocus();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;

      dobController.text = AppDateUtils.formatBirthDate(pickedDate);
    }
  }
}
