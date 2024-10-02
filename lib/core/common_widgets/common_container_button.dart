
import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:diary_app/core/utils/common_gradient_color.dart';
import 'package:flutter/material.dart';

Widget commonContainerButton({required String buttonText,void Function()? onTap, Color? containerColor,Gradient? gradient,}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: screenWidth(context: navigatorKey.currentContext!) / 2.3,
        decoration: BoxDecoration(
          gradient: commonGradientColor(),
          borderRadius: BorderRadius.circular(10),
          color: containerColor??kRed,
        ),
        child: Center(
          child: TextWidgetCommon(
            fontSize: 18,
            text: buttonText,
          ),
        ),
      ),
    );
  }