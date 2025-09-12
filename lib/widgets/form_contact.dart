import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/widgets/custom_input.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart'; // 👈 مهم عشان .tr

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

      // ✅ تنظيف الحقول
      nameController.clear();
      emailController.clear();
      messageController.clear();

      FocusScope.of(context).unfocus();

      _showDialog("success_title".tr(context), "success_msg".tr(context));
    } catch (e) {
      _showDialog("error_title".tr(context), "${"error_msg".tr(context)}\n$e");
      print(e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              FocusScope.of(context).unfocus();
            },
            child: Text("ok".tr(context)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AbsorbPointer(
        absorbing: _isLoading,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            children: [
              Input(
                hint: "your_name".tr(context),
                controller: nameController,
                validator: (value) =>
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
                  if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}")
                      .hasMatch(value)) {
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
                validator: (value) =>
                    value == null || value.isEmpty
                        ? "validate_message".tr(context)
                        : null,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: sendMessage,
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
