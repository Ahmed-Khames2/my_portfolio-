// custom_input.dart
import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
class Input extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const Input({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fillColor = theme.inputDecorationTheme.fillColor ?? theme.colorScheme.surface;
    final borderColor = theme.colorScheme.onSurface.withOpacity(0.2);
    final focusedColor = theme.colorScheme.primary;

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: focusedColor, width: 1.2),
        ),
      ),
    );
  }
}
