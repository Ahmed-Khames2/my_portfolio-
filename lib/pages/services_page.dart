import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/widgets/custom_servised_card.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  int _current = 0;

  final services = [
    (
      "mobile_app".tr,
      "mobile_app_desc".tr,
      Icons.phone_android,
      Colors.blue
    ),
    (
      "api_integration".tr,
      "api_integration_desc".tr,
      Icons.api,
      Colors.green
    ),
    (
      "firebase_backend".tr,
      "firebase_backend_desc".tr,
      Icons.cloud,
      Colors.orange
    ),
    (
      "ui_impl".tr,
      "ui_impl_desc".tr,
      Icons.design_services,
      Colors.purple
    ),
    (
      "ai_integration".tr,
      "ai_integration_desc".tr,
      Icons.smart_toy,
      Colors.red
    ),
    (
      "placeholder_service".tr,
      "placeholder_desc".tr,
      Icons.build,
      Colors.teal
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("our_services".tr(context)),
        const SizedBox(height: 24),

        CarouselSlider.builder(
          itemCount: services.length,
          options: CarouselOptions(
            height: 340,
            enlargeCenterPage: true,
            viewportFraction: 0.33,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemBuilder: (ctx, i, realIdx) {
            final s = services[i];
            final isCenter = i == _current;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              transform: isCenter
                  ? (Matrix4.identity()..scale(1.08))
                  : Matrix4.identity(),
              child: ServiceCard(
                title: s.$1(context),
                desc: s.$2(context),
                icon: s.$3,
                isCenter: isCenter,
                iconColor: s.$4,
              ),
            );
          },
        ),
      ],
    );
  }
}
