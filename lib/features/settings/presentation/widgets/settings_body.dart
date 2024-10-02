import 'package:diary_app/core/common_widgets/common_container_button.dart';
import 'package:diary_app/core/common_widgets/text_widget_common.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:diary_app/core/enums/enums.dart';
import 'package:diary_app/core/service_locator/service_locator.dart';
import 'package:diary_app/core/utils/common_db_functions.dart';
import 'package:diary_app/core/utils/common_gradient_color.dart';
import 'package:diary_app/core/utils/message_show_helper.dart';
import 'package:diary_app/features/authentication/data/model/user_model/user_model.dart';
import 'package:diary_app/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:diary_app/features/settings/presentation/widgets/common_gradient_container.dart';
import 'package:diary_app/features/settings/presentation/utils/common_settings_textfield_dialog.dart';
import 'package:diary_app/features/settings/presentation/widgets/user_image_show_and_select_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget settingsBody({
  required TextEditingController changeNameController,
  required TextEditingController changePasswordController,
}) {
  return StreamBuilder<UserModel>(
    stream: CommonDbFunctions.getUserDataByIdAsStream(
      userId: serviceLocator<FirebaseAuth>().currentUser?.uid,
    ),
    builder: (context, snapshot) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            userImageShowAndSelectWIdget(
              snapshot: snapshot,
            ),
            TextWidgetCommon(
              textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,
              text: snapshot.data?.userName ?? 'No name',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            kHeight20,
            commonGradientContainer(
              leadingIcon: Icons.email_outlined,
              title: "Name",
              controller: changeNameController,
              subTitle: snapshot.data?.userName ?? 'No name',
              isEditable: true,
              onPressed: () {
                commonSettingsTextFieldDialogBox(
                  textEditingController: changeNameController,
                  currentUserData: snapshot.data,
                  fieldType: FieldType.name,
                );
              },
            ),
            kHeight10,
            commonGradientContainer(
              leadingIcon: Icons.email_outlined,
              title: "Email",
              subTitle: snapshot.data?.userEmail ?? 'No email',
            ),
            kHeight10,
            commonGradientContainer(
              onPressed: () {
                commonSettingsTextFieldDialogBox(
                  textEditingController: changePasswordController,
                  currentUserData: snapshot.data,
                  fieldType: FieldType.password,
                );
              },
              leadingIcon: Icons.password,
              title: "Password",
              controller: changePasswordController,
              subTitle: snapshot.data?.userPassword ?? 'No password',
              isEditable: true,
            ),
            kHeight20,
            commonContainerButton(
              gradient: commonGradientColor(),
              buttonText: "LogOut",
              onTap: () {
                MessageShowHelper.showDialogBox(
                  dialogTitle: "LogOut",
                  dialogContent: "Do you want to logout from this account?",
                  actionButtonName: "LogOut",
                  buttonActionMethod: () {
                    context.read<AuthenticationBloc>().add(LogOutUserEvent());
                    navigatorKey.currentState?.pop();
                  },
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

