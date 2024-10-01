import 'package:diary_app/config/routes/routes_name.dart';
import 'package:diary_app/features/authentication/presentation/pages/login/login_page.dart';
import 'package:diary_app/features/authentication/presentation/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
class AppRoutes{
  static  Map<String, Widget Function(BuildContext)> routes = {
    AppRouteName.loginPage : (context)=>const LoginPage(),
    AppRouteName.signUpPage : (context)=>const SignUpPage(),
    // AppRouteName.wrapperPage : (context)=>const WrapperPage(),
  };
}