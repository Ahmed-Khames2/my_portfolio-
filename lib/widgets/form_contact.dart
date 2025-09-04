// import 'package:flutter/material.dart';
// import 'package:my_portfolio2/core/app_colors.dart';
// import 'package:my_portfolio2/core/app_locallizatin.dart';
// import 'package:my_portfolio2/widgets/custom_input.dart';

// class FormContact extends StatelessWidget {
//   const FormContact({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: AppColors.divider),
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Input(hint: "your_name".tr(context)),
//           const SizedBox(height: 10),
//           Input(hint: "your_email".tr(context)),
//           const SizedBox(height: 10),
//           Input(hint: "your_message".tr(context), maxLines: 5),
//           const SizedBox(height: 12),
//           Align(
//             alignment: Alignment.centerRight,
//             child: ElevatedButton(
//               onPressed: () {},
//               child: Text("send_message".tr(context)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio2/core/app_colors.dart';
import 'package:my_portfolio2/core/app_locallizatin.dart';
import 'package:my_portfolio2/widgets/custom_input.dart';

class FormContact extends StatefulWidget {
  const FormContact({super.key});

  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  Future<void> sendMessage() async {
    const url =
        "https://script.google.com/macros/s/AKfycbzv1Mg_KGMi7DG4SEHrk0yF4CxgS5GHEXzL1HZSSDypJ3bnvObgjH3q_N_KFIwJF7fY/exec";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          "name": nameController.text,
          "email": emailController.text,
          "message": messageController.text,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("✅ Message sent successfully!")));
        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("❌ Failed to send message.")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("⚠️ Error: $e")),
        // ignore: avoid_print
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Input(hint: "your_name".tr(context), controller: nameController),
          const SizedBox(height: 10),
          Input(hint: "your_email".tr(context), controller: emailController),
          const SizedBox(height: 10),
          Input(
            hint: "your_message".tr(context),
            maxLines: 5,
            controller: messageController,
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: sendMessage,
              child: Text("send_message".tr(context)),
            ),
          ),
        ],
      ),
    );
  }
}
