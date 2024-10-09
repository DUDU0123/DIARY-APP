import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/add_button.dart';
import 'package:flutter/material.dart';

class DiaryEntryField extends StatelessWidget {
  final TextEditingController contentController;
  final Function() onSave;
  final FocusNode? focusNode;

  const DiaryEntryField({
    super.key,
    required this.contentController,
    required this.onSave,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          focusNode.requestFocus();
        },
        child: Container(
          decoration: BoxDecoration(
            color: kFadedYellow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  focusNode: focusNode,
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
      ),
    );
  }
}
