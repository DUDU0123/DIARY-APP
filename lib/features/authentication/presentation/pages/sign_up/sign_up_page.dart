import 'package:diary_app/core/enums/enums.dart';
import 'package:diary_app/features/authentication/presentation/widgets/common_auth_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(
        pageType: PageType.signUp,
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}
