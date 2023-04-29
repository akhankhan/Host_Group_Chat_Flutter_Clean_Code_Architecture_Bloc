import 'package:flutter/material.dart';
import 'package:host_group_chat/constant.dart';
import 'package:host_group_chat/features/presentation/widgets/button_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/header_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/row_text_widget.dart';
import 'package:host_group_chat/features/presentation/widgets/textfield_container_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
          child: Column(
            children: [
              HeaderWidget(title: 'Forgot Password'),
              const SizedBox(height: 20),
              const Text(
                  "Don't worry! Just fill in your email and  ${AppConst.appName} will send you a link to rest your passwrod."),
              const SizedBox(height: 20),
              TextFieldContainerWidget(
                controller: _emailController,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(title: 'Send Password, Reset Email'),
              const SizedBox(
                height: 20,
              ),
              RowTextWidget(
                title1: "Remember the account information? ",
                title2: "Login",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, PageConst.loginPage, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
