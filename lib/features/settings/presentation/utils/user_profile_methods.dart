import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:diary_app/core/enums/enums.dart';
import 'package:diary_app/core/utils/message_show_helper.dart';
import 'package:diary_app/core/utils/pick_image.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:diary_app/features/settings/presentation/bloc/settings_user_profile/setting_user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileMethods {
  static void updateUserNameOrPassword({
    required FieldType fieldType,
    TextEditingController? textEditingController,
    required UserModel? currentUserData,
  }) {
    switch (fieldType) {
      case FieldType.name:
        if (textEditingController != null) {
          if (textEditingController.text.isNotEmpty) {
            final updatedUserData = currentUserData?.copyWith(
              userName: textEditingController.text,
            );
            navigatorKey.currentContext?.read<SettingUserProfileBloc>().add(
                  UpdateUserDataEvent(
                    updatedUserModel: updatedUserData,
                  ),
                );
          }
        } else {
          MessageShowHelper.showSnackbar(
              snackBarContent: "Enter name is empty");
        }
        break;
      case FieldType.password:
        RegExp passwordRegExp = RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&#]{8,}$');
        if (textEditingController != null) {
          if (textEditingController.text.isNotEmpty &&
              passwordRegExp.hasMatch(textEditingController.text)) {
            final updatedUserData = currentUserData?.copyWith(
              userPassword: textEditingController.text,
            );
            navigatorKey.currentContext?.read<SettingUserProfileBloc>().add(
                  UpdateUserDataEvent(
                    updatedUserModel: updatedUserData,
                  ),
                );
          } else {
            MessageShowHelper.showSnackbar(
                snackBarContent: "Enter strong password");
          }
        } else {
          MessageShowHelper.showSnackbar(
              snackBarContent: "Enter strong password");
        }
        break;
      default:
    }
    navigatorKey.currentState?.pop();
  }

  static void updateUserProfileImage({required UserModel? userData}) async {
    final imageFile = await PickImage.pickImageFromGallery();
    if (imageFile != null && userData != null) {
      navigatorKey.currentContext?.read<SettingUserProfileBloc>().add(
            UpdateUserProfileImageEvent(
              file: imageFile,
              updatedUserModel: userData,
            ),
          );
    } else {
      MessageShowHelper.showSnackbar(snackBarContent: "Unable to pick image");
    }
  }
}
