import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_content.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_date.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_title.dart';
import 'package:flutter/material.dart';

class DiaryViewPage extends StatelessWidget {
  final Diary diary;
  const DiaryViewPage({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPink,
      appBar: AppBar(
        backgroundColor: kPink,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: kdarkerRed),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: kdarkerRed),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DiaryDate(date: diary.createdAt),
            kHeight15,
            DiaryTitle(title: diary.title),
            kHeight15,
            Expanded(child: DiaryContent(content: diary.content)),
          ],
        ),
      ),
    );
  }
}
