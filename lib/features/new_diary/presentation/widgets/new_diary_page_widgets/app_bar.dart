import 'package:diary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class NewDiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewDiaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPink,
      leading: const Icon(Icons.arrow_back_ios),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.cancel,
            color: kRed,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
