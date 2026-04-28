import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodu_app/app/themes/app_colors.dart';

class ProfileAvatarPicker extends StatelessWidget {
  final VoidCallback? onTap;
  final File? imageFile;

  const ProfileAvatarPicker({super.key, this.onTap, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Avatar con borde controlado
        Container(
          width: 180,
          height: 180,

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            // Imagen
            image: DecorationImage(
              image: imageFile != null
                  ? FileImage(imageFile!)
                  : const AssetImage("assets/images/not_avatar.png")
                        as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Botón editar
        Positioned(
          bottom: 10,
          right: 10,

          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 36,
              height: 36,

              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),

              child: const Icon(Icons.edit, size: 25, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
