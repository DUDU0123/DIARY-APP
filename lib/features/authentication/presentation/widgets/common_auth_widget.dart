import 'package:diary_app/config/routes/routes_name.dart';
import 'package:diary_app/core/common_widgets/common_container_button.dart';
import 'package:diary_app/core/common_widgets/common_loading.dart';
import 'package:diary_app/core/common_widgets/text_field_common_widget.dart';
import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:diary_app/core/enums/enums.dart';
import 'package:diary_app/core/utils/message_show_helper.dart';
import 'package:diary_app/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationErrorState) {
          MessageShowHelper.showSnackbar(snackBarContent: state.message);
        }
        if (state is AuthenticationSuccessState) {
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppRouteName.diaryHomePage,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              width: screenWidth(context: context),
              height: screenHeight(context: context),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/diary_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SizedBox(
                    height: screenHeight(context: context),
                    width: screenWidth(context: context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        kHeight30,
                        TextWidgetCommon(
                          textColor: kPink,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          text: pageType == PageType.login ? "Login" : "SignUp",
                        ),
                        kHeight30,
                        TextFieldCommon(
                          hintText: "Enter email",
                          style:const TextStyle(color: kWhite),
                          hintStyle: const TextStyle(color: kWhite),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: kPink)),
                          controller: emailController,
                          textAlign: TextAlign.start,
                        ),
                        kHeight15,
                        TextFieldCommon(
                          hintText: "Enter password",
                          hintStyle: const TextStyle(color: kWhite),
                          style:const TextStyle(color: kWhite),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: kPink)),
                          controller: passwordController,
                          textAlign: TextAlign.start,
                        ),
                        kHeight15,
                        commonContainerButton(
                          onTap: () {
                            final email = emailController.text;
                            final password = passwordController.text;
                            if (pageType == PageType.login) {
                              context.read<AuthenticationBloc>().add(
                                    LogInUserEvent(
                                      userEmail: email,
                                      userPassword: password,
                                    ),
                                  );
                            } else {
                              context.read<AuthenticationBloc>().add(
                                    SignUpUserEvent(
                                      userEmail: email,
                                      userPassword: password,
                                    ),
                                  );
                            }
                          },
                          buttonText:
                              pageType == PageType.login ? "Login" : "SignUp",
                        ),
                        kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidgetCommon(
                              textColor: kWhite,
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
                                fontWeight: FontWeight.bold,
                                textColor: kWhite,
                                text: pageType == PageType.login
                                    ? "SignUp"
                                    : "Login",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state is AuthenticationLoadingState)
              const OverlayLoadingHolder()
          ],
        );
      },
    );
  }
}
