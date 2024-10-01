import 'package:diary_app/config/routes/routes_name.dart';
import 'package:diary_app/core/common_widgets/common_container_button.dart';
import 'package:diary_app/core/common_widgets/text_field_common_widget.dart';
import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:diary_app/core/enums/enums.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.pageType,
    required this.emailController,
    required this.passwordController,
  });
  final PageType pageType;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: screenWidth(context: context),
          height: screenHeight(context: context),
          child: Image.asset(
            "assets/diary_bg.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,left: 10,
          child: TextWidgetCommon(
            textColor: const Color.fromARGB(255, 255, 224, 133),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            text: pageType == PageType.login ? "Login" : "SignUp",
          ),

        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: screenHeight(context: context),
              width: screenWidth(context: context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kHeight30,
                  TextFieldCommon(
                    hintText: "Enter email",
                    border: const OutlineInputBorder(),
                    controller: emailController,
                    textAlign: TextAlign.start,
                  ),
                  kHeight15,
                  TextFieldCommon(
                    hintText: "Enter password",
                    border: const OutlineInputBorder(),
                    controller: passwordController,
                    textAlign: TextAlign.start,
                  ),
                  kHeight15,
                  commonContainerButton(
                    onTap: () {
                      if (pageType == PageType.login) {
                      } else {}
                    },
                    buttonText: pageType == PageType.login ? "Login" : "SignUp",
                  ),
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidgetCommon(
                        text: pageType == PageType.login
                            ? "Don't have an account?"
                            : "Already have an account?",
                      ),
                      GestureDetector(
                        onTap: () {
                          if (pageType == PageType.login) {
                            navigatorKey.currentState
                                ?.pushNamed(AppRouteName.signUpPage);
                          } else {
                            navigatorKey.currentState
                                ?.pushNamed(AppRouteName.loginPage);
                          }
                        },
                        child: TextWidgetCommon(
                          text: pageType == PageType.login ? "SignUp" : "Login",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
