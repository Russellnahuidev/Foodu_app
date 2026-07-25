import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/themes/app_colors.dart';

class GenderDropdown extends StatefulWidget {
  final String? value;
  final Function(String) onChanged;

  const GenderDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  final GlobalKey _buttonKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  final List<String> _genders = [
    AppStrings.genderMale,
    AppStrings.genderFemale,
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bool isOpen = _overlayEntry != null;
    final bool hasValue = widget.value != null;

    Color iconColor;

    if (isOpen) {
      iconColor = AppColors.primary;
    } else if (hasValue) {
      iconColor = isDark ? Colors.white : Colors.black;
    } else {
      iconColor = isDark ? AppColors.grey600 : AppColors.grey400;
    }
    return GestureDetector(
      key: _buttonKey,
      onTap: _toggleDropdown,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.grey900 : AppColors.grey50,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          border: Border.all(
            color: _overlayEntry != null
                ? AppColors.primary
                : (isDark ? AppColors.grey900 : AppColors.grey200),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.value ?? AppStrings.genderHint,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: widget.value == null
                    ? Theme.of(context).hintColor
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Icon(
              _overlayEntry != null
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }

  void _toggleDropdown() {
    FocusScope.of(context).unfocus();
    if (_overlayEntry == null) {
      _showOverlay();
    } else {
      _removeOverlay();
    }
  }

  void _showOverlay() {
    final renderBox =
        _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // GestureDetector para cerrar al tocar fuera
          Positioned.fill(
            child: GestureDetector(
              onTap: () => _removeOverlay(),
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            top: position.dy + size.height + 4,
            left: position.dx,
            width: size.width,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
              child: _buildDropdownContent(),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {});
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {});
  }

  Widget _buildDropdownContent() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.grey900 : AppColors.grey50,
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _genders.map((g) {
          final isSelected = g == widget.value;
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              widget.onChanged(g);
              _removeOverlay();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? (isDark ? AppColors.grey800 : AppColors.grey300)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(g, style: Theme.of(context).textTheme.bodyLarge),
                  if (isSelected)
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: AppColors.primary,
                        size: 18,
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
