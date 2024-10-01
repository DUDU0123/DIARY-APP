import 'package:diary_app/config/routes/app_routes.dart';
import 'package:diary_app/config/routes/routes_name.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:flutter/material.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute:AppRouteName.loginPage,
      routes:AppRoutes.routes
    );
  }
}
