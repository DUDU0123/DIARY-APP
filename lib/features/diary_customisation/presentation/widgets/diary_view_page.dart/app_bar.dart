import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/features/new_diary/presentation/screens/new_diary_page.dart';
import 'package:flutter/material.dart';

class DiaryViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Diary diary;
  final Function(BuildContext) onDeletePressed;
  final Function() onEditPressed;

  const DiaryViewAppBar({
    super.key,
    required this.diary,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPink,
      actions: [
        IconButton(
          icon: const Icon(Icons.edit, color: kdarkerRed),
          onPressed: onEditPressed,
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: kdarkerRed),
          onPressed: () => onDeletePressed(context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
