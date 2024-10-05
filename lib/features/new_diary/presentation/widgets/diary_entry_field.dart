import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/add_button.dart';
import 'package:flutter/material.dart';

class DiaryEntryField extends StatelessWidget {
  final TextEditingController contentController;
  final Function() onSave;
  const DiaryEntryField(
      {super.key, required this.contentController, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: kYellow.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                maxLines: null,
                controller: contentController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: AddButton(
                onPressed: onSave,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
