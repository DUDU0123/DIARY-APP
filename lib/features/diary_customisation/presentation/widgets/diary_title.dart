import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class DiaryTitle extends StatelessWidget {
  const DiaryTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: kFadedYellow,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
