import 'package:diary_app/core/common_widgets/common_container_button.dart';
import 'package:diary_app/core/common_widgets/text_field_common_widget.dart';
import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:diary_app/core/enums/enums.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:diary_app/features/settings/presentation/utils/user_profile_methods.dart';
import 'package:flutter/material.dart';

Future<dynamic> commonSettingsTextFieldDialogBox({
  required FieldType fieldType,
  TextEditingController? textEditingController,
  required UserModel? currentUserData,
}) {
  return showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) {
      return AlertDialog(
        title: TextWidgetCommon(
            text: "New ${fieldType == FieldType.name ? "Name" : "Password"}"),
        content: TextFieldCommon(
          
          textAlign: TextAlign.start,
          controller: textEditingController,
          border: const OutlineInputBorder(),
          cursorColor: kBlack,
        ),
        actions: [
          commonContainerButton(
            buttonText: "Change",
            containerColor: kGrey,
            onTap: () {
              UserProfileMethods.updateUserNameOrPassword(
                fieldType: fieldType,
                currentUserData: currentUserData,
                textEditingController: textEditingController,
              );
            },
          )
        ],
      );
    },
  );
}
