import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio2/widgets/custom_input.dart';
import 'package:my_portfolio2/core/app_localization.dart';

class FormContact extends StatefulWidget {
  const FormContact({super.key});

  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  final String scriptUrl =
      "https://script.google.com/macros/s/AKfycbyF1YbPhpky6NyjwmEP88mqiJX1Sj-4eRdx-KMPo5-wbJpPf_lWvaEiR4IpV_cqZFX6/exec";

  Future<void> sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await http.post(
        Uri.parse(scriptUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          "name": nameController.text,
          "email": emailController.text,
          "message": messageController.text,
        },
      );

      nameController.clear();
      emailController.clear();
      messageController.clear();

      if (!mounted) return;
      FocusScope.of(context).unfocus();

      _showSnackBar(
        message: "success_msg".tr(context),
        isSuccess: true,
      );
    } catch (e) {
      if (!mounted) return;
      _showSnackBar(
        message: "error_msg".tr(context),
        isSuccess: false,
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showSnackBar({required String message, required bool isSuccess}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: isSuccess ? Colors.green.shade700 : Colors.red.shade700,
        duration: const Duration(seconds: 4),
        content: Row(
          children: [
            Icon(
              isSuccess ? Icons.check_circle_outline : Icons.error_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Form(
      key: _formKey,
      child: AbsorbPointer(
        absorbing: _isLoading,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name Field
              Input(
                hint: "your_name".tr(context),
                controller: nameController,
                prefixIcon: Icons.person_outline,
                validator: (value) =>
                    value == null || value.trim().isEmpty
                        ? "validate_name".tr(context)
                        : null,
              ),
              const SizedBox(height: 16),

              // Email Field
              Input(
                hint: "your_email".tr(context),
                controller: emailController,
                prefixIcon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "validate_email".tr(context);
                  }
                  if (!RegExp(
                    r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}",
                  ).hasMatch(value.trim())) {
                    return "validate_email_format".tr(context);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Message Field
              Input(
                hint: "your_message".tr(context),
                maxLines: 5,
                controller: messageController,
                prefixIcon: Icons.chat_bubble_outline,
                validator: (value) =>
                    value == null || value.trim().isEmpty
                        ? "validate_message".tr(context)
                        : null,
              ),
              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                height: 50,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: theme.colorScheme.primary,
                        ),
                      )
                    : ElevatedButton.icon(
                        onPressed: sendMessage,
                        icon: const Icon(Icons.send_rounded, size: 20),
                        label: Text(
                          "send_message".tr(context),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
