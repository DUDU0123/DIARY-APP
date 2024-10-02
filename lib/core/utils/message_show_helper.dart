import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:flutter/material.dart';

class MessageShowHelper {
 static void showDialogBox({
    required String dialogTitle,
    required String dialogContent,
    required String actionButtonName,
    required void Function()? buttonActionMethod,
  }) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: TextWidgetCommon(
          textColor: kBlack,
          text: dialogTitle,
          fontSize: 18,
        ),
        content: TextWidgetCommon(
          textColor: kBlack,
          fontSize: 16,
          text: dialogContent,
        ),
        actions: [
          commonTextButton(
            buttonActionMethod: () {
              navigatorKey.currentState?.pop();
            },
            buttonText: 'Cancel',
          ),
          commonTextButton(
            buttonActionMethod: buttonActionMethod,
            buttonText: actionButtonName,
          ),
        ],
      ),
    );
  }

 static void showSnackbar({
    required String snackBarContent,
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!)..hideCurrentSnackBar()..showSnackBar(
      SnackBar(
        content: TextWidgetCommon(
          text: snackBarContent,textColor: kWhite,
          fontSize: 18,
        ),
        backgroundColor: kBlack,
        duration: const Duration(seconds: 1,),
      ),
    );
  }
}
Widget commonTextButton({
  required String buttonText,
  required void Function()? buttonActionMethod,
}) {
  return TextButton(
    onPressed: buttonActionMethod,
    child: TextWidgetCommon(
      textColor: kBlack,
      fontSize: 18,
      text: buttonText,
    ),
  );
}