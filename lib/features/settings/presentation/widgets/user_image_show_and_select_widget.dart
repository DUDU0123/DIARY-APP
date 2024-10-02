import 'package:diary_app/config/routes/routes_name.dart';
import 'package:diary_app/core/common_widgets/common_small_widgets.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:diary_app/core/utils/common_gradient_color.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:diary_app/features/settings/presentation/utils/user_profile_methods.dart';
import 'package:flutter/material.dart';

Widget userImageShowAndSelectWIdget({
  required AsyncSnapshot<UserModel> snapshot,
}) {
  return Stack(
    children: [
      Center(
        child: GestureDetector(
          onTap: () {
            if (snapshot.data?.userProfilePic != null) {
              navigatorKey.currentState?.pushNamed(
                AppRouteName.profileImagePage,
                arguments: snapshot.data?.userProfilePic!,
              );
            }
          },
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: kBlack.withOpacity(0.2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: commonImageShowWidget(image: snapshot.data?.userProfilePic),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        right: screenWidth(context: navigatorKey.currentContext!) / 4,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: commonGradientColor(),
          ),
          child: IconButton(
            onPressed: () async {
              UserProfileMethods.updateUserProfileImage(
                userData: snapshot.data,
              );
            },
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 40,
              color: kBlack,
            ),
          ),
        ),
      ),
    ],
  );
}

