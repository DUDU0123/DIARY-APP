import 'package:diary_app/config/routes/routes_name.dart';
import 'package:diary_app/features/authentication/presentation/pages/login/login_page.dart';
import 'package:diary_app/features/authentication/presentation/pages/sign_up/sign_up_page.dart';
import 'package:diary_app/features/diary_home/presentation/pages/diary_home_page.dart';
import 'package:diary_app/features/settings/presentation/pages/profile_image_show_widget.dart';
import 'package:diary_app/features/settings/presentation/pages/user_profile_settings_page.dart';
import 'package:diary_app/features/wrapper/wrapper_page.dart';
import 'package:flutter/material.dart';

import '../../features/new_diary/presentation/widgets/new_diary_page_widgets/home_screen_view.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteName.loginPage: (context) => const LoginPage(),
    AppRouteName.signUpPage: (context) => const SignUpPage(),
    AppRouteName.wrapperPage: (context) => const WrapperPage(),
    AppRouteName.profileImagePage: (context) => const ProfileImageShowWidget(),
    AppRouteName.diaryHomePage: (context) => const DiaryHomePage(),
    AppRouteName.userProfileSettingsPage: (context) =>
        const UserProfileSettingsPage(),
    AppRouteName.newDiaryPage: (context) => const NewDiaryAddPage()
  };
}
