
/* ========================= TESTIMONIALS ========================= */
import 'package:flutter/material.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/widgets/custom_testmo_card.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cards = [
      TestimonialCard(
        quote: "Great developer — delivered on time with clean code.",
        author: "Client A, Startup"),
      TestimonialCard(
        quote: "Excellent communication and solid Flutter skills.",
        author: "Client B, Freelancer"),
      TestimonialCard(
        quote: "Understands requirements and suggests better solutions.",
        author: "Teammate C"),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle("Testimonials"),
        const SizedBox(height: 16),
        LayoutBuilder(builder: (ctx, c) {
          final cols = c.maxWidth < 900 ? 1 : 3;
          final gap = 16.0;
          final w = (c.maxWidth - gap * (cols - 1)) / cols;
          return Wrap(
            spacing: gap, runSpacing: gap,
            children: cards.map((wgt) => SizedBox(width: w, child: wgt)).toList(),
          );
        }),
      ],
    );
  }
}