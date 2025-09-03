import 'package:flutter/material.dart';
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/utils/helpers.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final t = Theme.of(context).textTheme;

    return Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    SectionTitle('education_title'.tr(context)),
    const SizedBox(height: 16),

    // 🧱 الحاوية العامة لكل التعليم
    Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 20,
        vertical: isMobile ? 12 : 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // 🎓 جامعة أسيوط
          EducationRow(
            icon: 'assets/images/assiut.png',
            title: "education_assiut_title".tr(context),
            subtitle: "education_assiut_subtitle".tr(context),
            details: "education_assiut_details".tr(context),
            isMobile: isMobile,
            textTheme: t,
          ),
          const SizedBox(height: 14),
          Divider(color: AppColors.divider, height: 1),
          const SizedBox(height: 14),

          // 🎓 جامعة كفر الشيخ
          EducationRow(
            icon: 'assets/images/kafr.png',
            title: "education_kafr_title".tr(context),
            subtitle: "education_kafr_subtitle".tr(context),
            details: "education_kafr_details".tr(context),
            isMobile: isMobile,
            textTheme: t,
          ),
          const SizedBox(height: 14),
          Divider(color: AppColors.divider, height: 1),
          const SizedBox(height: 14),

          // 🚀 مبادرة رواد مصر الرقمية
          EducationRow(
            icon: 'assets/images/DEPI.jpg',
            title: "education_depi_title".tr(context),
            subtitle: "education_depi_subtitle".tr(context),
            details: "education_depi_details".tr(context),
            isMobile: isMobile,
            textTheme: t,
          ),
          const SizedBox(height: 14),
          Divider(color: AppColors.divider, height: 1),
          const SizedBox(height: 14),

          // 🎓 كورس Udemy
          EducationRow(
            icon: 'assets/images/ud.png',
            title: "education_udemy_title".tr(context),
            subtitle: "education_udemy_subtitle".tr(context),
            details: "education_udemy_details".tr(context),
            isMobile: isMobile,
            textTheme: t,
          ),
        ],
      ),
    ),
  ],
);

  }
}

class EducationRow extends StatelessWidget {
  final String icon, title, subtitle, details;
  final bool isMobile;
  final TextTheme textTheme;
  final double barWidth;
  final double imageWidth;

  const EducationRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.details,
    required this.isMobile,
    required this.textTheme,
    this.barWidth = 4,
    double? imageWidth,
  }) : imageWidth = imageWidth ?? ( /* عرض الصورة */ (700 < 700 ? 56 : 84));

  @override
  Widget build(BuildContext context) {
    // علشان نخلي كل عناصر الرو بنفس الارتفاع ونخلي الصورة قد الخط
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 🎯 الخط الملون (accent)
          Container(
            width: barWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primary, AppColors.primary.withOpacity(.65)],
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 🖼️ الصورة بنفس ارتفاع الصف كله
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: isMobile ? 56 : 84,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(icon, fit: BoxFit.cover),
                  // طبقة شفافة خفيفة تعطي حداثة
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.06),
                          Colors.black.withOpacity(0.02),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 16),

          // 📚 النصوص
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: isMobile ? 6 : 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: isMobile ? 15 : 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: isMobile ? 12.5 : 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    details,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary.withOpacity(.9),
                      height: 1.35,
                      fontSize: isMobile ? 12 : 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
