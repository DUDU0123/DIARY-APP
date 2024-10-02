import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/core/utils/common_gradient_color.dart';
import 'package:flutter/material.dart';

Widget commonGradientContainer({
  required String title,
  required String subTitle,
  required IconData leadingIcon,
  void Function()? onPressed,
  TextEditingController? controller,
  bool isEditable = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      gradient: commonGradientColor(),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(leadingIcon),
            kWidth15,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidgetCommon(
                  text: title,
                  textColor: kBlack,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 190,
                  child: TextWidgetCommon(
                    text: subTitle,
                    textColor: kBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        isEditable
            ? IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.edit,
                  color: kBlack,
                ),
              )
            : zeroMeasuredWidget,
      ],
    ),
  );
}