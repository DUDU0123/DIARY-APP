import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/features/settings/presentation/widgets/settings_body.dart';
import 'package:flutter/material.dart';

class UserProfileSettingsPage extends StatefulWidget {
  const UserProfileSettingsPage({super.key});

  @override
  State<UserProfileSettingsPage> createState() =>
      _UserProfileSettingsPageState();
}

class _UserProfileSettingsPageState extends State<UserProfileSettingsPage> {
  TextEditingController changePasswordController = TextEditingController();
  TextEditingController changeNameController = TextEditingController();
  @override
  void dispose() {
    changePasswordController.dispose();
    changeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidgetCommon(
          text: "Settings",
          textColor: kBlack,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: screenWidth(context: context),
          child: settingsBody(
            changeNameController: changeNameController,
            changePasswordController: changePasswordController,
          ),
        ),
      ),
    );
  }
}
