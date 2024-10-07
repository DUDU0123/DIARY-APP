import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/navigator_key.dart';
import 'package:flutter/material.dart';

class NewDiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewDiaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPink,
      leading: GestureDetector(
        onTap: () {
          navigatorKey.currentState?.pop();
        },
        child: const Icon(Icons.arrow_back_ios)),
      actions:  [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              navigatorKey.currentState?.pop();
            },
            child: const Icon(
              Icons.cancel,
              color: kRed,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
