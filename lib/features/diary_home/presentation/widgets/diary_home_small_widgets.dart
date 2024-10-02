import 'package:diary_app/config/routes/routes_name.dart';
import 'package:diary_app/core/common_widgets/common_small_widgets.dart';
import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:diary_app/core/service_locator/service_locator.dart';
import 'package:diary_app/core/utils/common_db_functions.dart';
import 'package:diary_app/core/utils/common_gradient_color.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

diaryHomeAppBarTitle() {
  return StreamBuilder<UserModel>(
      stream: CommonDbFunctions.getUserDataByIdAsStream(
        userId: serviceLocator<FirebaseAuth>().currentUser?.uid,
      ),
      builder: (context, snapshot) {
        return TextWidgetCommon(
          text: snapshot.data != null && snapshot.data?.userName != null
              ? "Hi, ${snapshot.data?.userName}"
              : "Your Journals",
        );
      });
}
Widget userProfileNavigateIcon() {
    return GestureDetector(
      onTap: () {
        navigatorKey.currentState
            ?.pushNamed(AppRouteName.userProfileSettingsPage);
      },
      child: StreamBuilder<UserModel>(
          stream: CommonDbFunctions.getUserDataByIdAsStream(
            userId: serviceLocator<FirebaseAuth>().currentUser?.uid,
          ),
          builder: (context, snapshot) {
            return Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                gradient: commonGradientColor(),
                shape: BoxShape.circle,
              ),
              child: snapshot.data != null
                  ? snapshot.data!.userProfilePic != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: commonImageShowWidget(
                            image: snapshot.data?.userProfilePic,
                          ))
                      : Center(
                          child: commonPersonIcon(),
                        )
                  : Center(
                      child: commonPersonIcon(),
                    ),
            );
          }),
    );
  }