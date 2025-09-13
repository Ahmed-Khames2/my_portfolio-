import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';
import 'package:my_portfolio2/widgets/SectionTitle.dart';
import 'package:my_portfolio2/widgets/custom_servised_card.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  int _current = 0;

  final services = [
    ("mobile_app".tr, "mobile_app_desc".tr, Icons.phone_android, Colors.blue),
    ("api_integration".tr, "api_integration_desc".tr, Icons.api, Colors.green),
    (
      "firebase_backend".tr,
      "firebase_backend_desc".tr,
      Icons.cloud,
      Colors.orange,
    ),
    ("ui_impl".tr, "ui_impl_desc".tr, Icons.design_services, Colors.purple),
    (
      "ai_integration".tr,
      "ai_integration_desc".tr,
      Icons.smart_toy,
      Colors.red,
    ),
  ];

  void nextService() =>
      setState(() => _current = (_current + 1) % services.length);
  void prevService() => setState(
    () => _current = (_current - 1 + services.length) % services.length,
  );

  @override
  Widget build(BuildContext context) {
    final s = services[_current];
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          SectionTitle("our_services".tr(context)),
          const SizedBox(height: 30),

          SizedBox(
            height: size.width < 600 ? 400 : 380,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width:
                      size.width < 600 ? size.width * 0.85 : size.width * 0.45,
                  child: ServiceCard(
                    title: s.$1(context),
                    desc: s.$2(context),
                    icon: s.$3,
                    isCenter: true,
                    iconColor: s.$4,
                  ),
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 28, color: s.$4),
                    onPressed: prevService,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, size: 28, color: s.$4),
                    onPressed: nextService,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              services.length,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: _current == i ? 14 : 10,
                height: _current == i ? 14 : 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == i ? s.$4 : Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
