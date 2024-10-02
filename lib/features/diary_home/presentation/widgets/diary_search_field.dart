import 'package:diary_app/core/common_widgets/text_field_common_widget.dart';
import 'package:flutter/material.dart';

class DiarySearchField extends StatelessWidget {
  const DiarySearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextFieldCommon(
              hintText: 'Search',
              textAlign: TextAlign.left,
              border: InputBorder.none,
            ),
          ),
          Icon(Icons.search, color: Colors.grey),
        ],
      ),
    );
  }
}
