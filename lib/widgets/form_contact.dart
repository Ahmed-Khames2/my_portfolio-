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

      _showDialog("success_title".tr(context), "success_msg".tr(context));
    } catch (e) {
      if (!mounted) return;
      _showDialog(
        "error_title".tr(context),
        "${"error_msg".tr(context)}\nCheck internet",
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showDialog(String title, String message) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: theme.colorScheme.surface,
            title: Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            content: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.9),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  FocusScope.of(context).unfocus();
                },
                child: Text(
                  "ok".tr(context),
                  style: TextStyle(color: theme.colorScheme.primary),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: AbsorbPointer(
        absorbing: _isLoading,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.dividerColor),
          ),
          child: Column(
            children: [
              Input(
                hint: "your_name".tr(context),
                controller: nameController,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "validate_name".tr(context)
                            : null,
              ),
              const SizedBox(height: 10),
              Input(
                hint: "your_email".tr(context),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "validate_email".tr(context);
                  }
                  if (!RegExp(
                    r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}",
                  ).hasMatch(value)) {
                    return "validate_email_format".tr(context);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Input(
                hint: "your_message".tr(context),
                maxLines: 5,
                controller: messageController,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "validate_message".tr(context)
                            : null,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child:
                    _isLoading
                        ? CircularProgressIndicator(
                          color: theme.colorScheme.primary,
                        )
                        : ElevatedButton(
                          onPressed: sendMessage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                          ),
                          child: Text("send_message".tr(context)),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
