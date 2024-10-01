import 'package:diary_app/core/enums/enums.dart';
import 'package:diary_app/features/authentication/presentation/widgets/common_auth_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        pageType: PageType.login,
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}
