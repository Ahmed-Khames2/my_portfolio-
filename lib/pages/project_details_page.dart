import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio2/models/project_data.dart';
import 'package:my_portfolio2/widgets/appetize_embed.dart';
import 'package:my_portfolio2/widgets/custom_footer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                project.imagesBackGround,
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              project.title,
              style: t.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Divider under AppBar ───
              Divider(
                  height: 1,
                  color: colorScheme.onSurface.withValues(alpha: 0.08)),

              // ─── App Info Strip ───
              _buildInfoStrip(context, t, colorScheme, isDark, isWide),

              // ─── Live Demo ───
              if (project.demoUrl != null)
                _buildLiveDemoSection(context, t, colorScheme, isWide),

              const SizedBox(height: 48),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  // ────────────────────────────────────────────────────────
  Widget _buildInfoStrip(BuildContext context, TextTheme t,
      ColorScheme colorScheme, bool isDark, bool isWide) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 60 : 20,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  colorScheme.primary.withValues(alpha: 0.12),
                  colorScheme.surface,
                ]
              : [
                  colorScheme.primary.withValues(alpha: 0.06),
                  colorScheme.secondary.withValues(alpha: 0.03),
                  colorScheme.surface,
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border(
          bottom: BorderSide(
              color: colorScheme.onSurface.withValues(alpha: 0.07)),
        ),
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppIcon(colorScheme, isDark, size: 80),
                const SizedBox(width: 24),
                Expanded(child: _buildAppMeta(context, t, colorScheme)),
                const SizedBox(width: 24),
                _buildButtons(context, colorScheme),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAppIcon(colorScheme, isDark, size: 64),
                    const SizedBox(width: 16),
                    Expanded(
                        child: _buildAppMeta(context, t, colorScheme)),
                  ],
                ),
                const SizedBox(height: 16),
                _buildButtons(context, colorScheme),
              ],
            ),
    ).animate().fadeIn(duration: 300.ms);
  }

  Widget _buildAppIcon(ColorScheme colorScheme, bool isDark,
      {double size = 80}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isDark
            ? colorScheme.onSurface.withValues(alpha: 0.05)
            : Colors.white,
        borderRadius: BorderRadius.circular(size * 0.24),
        border: Border.all(
          color: colorScheme.onSurface.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: isDark ? 0.25 : 0.15),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.22),
        child: Image.asset(
          project.imagesBackGround,
          width: size,
          height: size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildAppMeta(
      BuildContext context, TextTheme t, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.description,
          style: t.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.75),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            _tag(context, '🕌 Islamic', colorScheme),
            _tag(context, 'Flutter', colorScheme),
            _tag(context, 'Offline', colorScheme),
            _tag(context, 'Open Source', colorScheme),
          ],
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context, ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (project.demoUrl != null) ...[
          ElevatedButton.icon(
            icon: const Icon(Icons.open_in_new_rounded, size: 16),
            label: const Text('Live Demo'),
            onPressed: () => _launch(project.demoUrl!),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
          const SizedBox(width: 10),
        ],
        OutlinedButton.icon(
          icon: const Icon(Icons.code_rounded, size: 16),
          label: const Text('GitHub'),
          onPressed: () => _launch(project.downloadUrl),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: colorScheme.primary.withValues(alpha: 0.5)),
            foregroundColor: colorScheme.primary,
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _tag(BuildContext context, String label, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: colorScheme.primary.withValues(alpha: 0.2)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  // ────────────────────────────────────────────────────────
  Widget _buildLiveDemoSection(BuildContext context, TextTheme t,
      ColorScheme colorScheme, bool isWide) {
    const double frameW = 360;
    const double frameH = 700;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          isWide ? 60 : 16, 32, isWide ? 60 : 16, 0),
      child: Center(
        child: Column(
          children: [
            // Label
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_circle_fill_rounded,
                    size: 20, color: colorScheme.primary),
                const SizedBox(width: 6),
                Text(
                  'Live Demo  •  No installation needed',
                  style: t.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 100.ms),

            const SizedBox(height: 20),

            // Phone frame
            Container(
              width: frameW,
              height: frameH,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(44),
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.45),
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 40,
                    spreadRadius: 4,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: AppetizeEmbed(url: project.demoUrl!),
              ),
            ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.04),
          ],
        ),
      ),
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
