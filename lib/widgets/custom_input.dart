import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final AutovalidateMode? autovalidateMode;

  const Input({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fillColor = theme.inputDecorationTheme.fillColor ?? theme.colorScheme.surface;
    final borderColor = theme.colorScheme.onSurface.withValues(alpha: 0.15);
    final focusedColor = theme.colorScheme.primary;

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      autovalidateMode: autovalidateMode,
      style: TextStyle(
        fontSize: 15,
        color: theme.colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(bottom: maxLines > 1 ? (maxLines * 12.0) : 0),
                child: Icon(
                  prefixIcon,
                  size: 20,
                  color: theme.colorScheme.primary.withValues(alpha: 0.8),
                ),
              )
            : null,
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: focusedColor, width: 1.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: theme.colorScheme.error, width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: theme.colorScheme.error, width: 1.8),
        ),
      ),
    );
  }
}
