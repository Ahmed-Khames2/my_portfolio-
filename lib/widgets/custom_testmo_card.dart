


import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';

class TestimonialCard extends StatelessWidget {
  final String quote, author;
  const TestimonialCard({super.key, required this.quote, required this.author});
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, size: 28, color: AppColors.secondary),
          const SizedBox(height: 8),
          Text(quote, style: t.bodyLarge),
          const SizedBox(height: 10),
          Text(author, style: t.bodyMedium),
        ],
      ),
    );
  }
}