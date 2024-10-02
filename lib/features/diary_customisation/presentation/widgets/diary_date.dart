import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/core/extensions/date_format.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class DiaryDate extends StatelessWidget {
  const DiaryDate({super.key, required this.date});
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: kFadedYellow,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_today, size: 18),
          kWidth10,
          Text(date.formatToMMMddyyyy(), style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
