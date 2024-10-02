import 'package:diary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DiaryContent extends StatelessWidget {
  const DiaryContent({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kFadedYellow,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Text(
          content,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
