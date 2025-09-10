import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/widgets/custom_input.dart';

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
      final response = await http.post(
        Uri.parse(scriptUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          "name": nameController.text,
          "email": emailController.text,
          "message": messageController.text,
        },
      );

      // ✅ أي استجابة نعتبرها نجاح
      nameController.clear();
      emailController.clear();
      messageController.clear();

      FocusScope.of(context).unfocus();

      _showDialog("✅ Message Sent", "Your message has been sent successfully!");
    } catch (e) {
      _showDialog("⚠️ Error", "Something went wrong.\n$e");
      print(e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  FocusScope.of(
                    context,
                  ).unfocus(); // ✅ يطرد المؤشر من أي TextField
                },
                child: const Text("OK"),
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
        // ✅ يمنع اللعب في الحقول أثناء اللودينج
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
                hint: "Your Name",
                controller: nameController,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Enter your name"
                            : null,
              ),
              const SizedBox(height: 10),
              Input(
                hint: "Your Email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Enter your email";
                  if (!RegExp(
                    r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}",
                  ).hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Input(
                hint: "Your Message",
                maxLines: 5,
                controller: messageController,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Enter your message"
                            : null,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child:
                    _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                          onPressed: sendMessage,
                          child: const Text("Send Message"),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
