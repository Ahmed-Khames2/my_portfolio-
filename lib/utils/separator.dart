import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: AppColors.divider.withValues(alpha: 0.5),
    );
  }
}