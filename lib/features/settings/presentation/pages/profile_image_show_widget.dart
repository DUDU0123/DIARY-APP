import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:flutter/material.dart';

class ProfileImageShowWidget extends StatelessWidget {
  const ProfileImageShowWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final String profileImageUrl = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const TextWidgetCommon(text: "Profile image"),
      ),
      body: Center(
        child: Container(
          width: screenWidth(context: context),
          height: screenHeight(context: context),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(profileImageUrl),)
          ),
        ),
      ),
    );
  }
}
