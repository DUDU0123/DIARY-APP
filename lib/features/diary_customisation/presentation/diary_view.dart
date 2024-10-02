import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_content.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_date.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_title.dart';
import 'package:flutter/material.dart';

class DiaryViewPage extends StatelessWidget {
  final String title = "A Beautiful Day";
  final String content =
      "Dear diary,\n\nToday was absolutely wonderful! The sun was shining, and I decided to take a long walk in the park. The flowers were in full bloom, filling the air with their sweet fragrance. I saw families picnicking and children playing joyfully.\n\nLater, I met up with Sarah for coffee. We caught up on old times and shared our recent experiences. It's always refreshing to connect with good friends.\n\nIn the evening, I treated myself to a home-cooked meal and watched my favorite movie. These simple pleasures remind me of how beautiful life can be.\n\nI'm grateful for days like this that rejuvenate my spirit and remind me to appreciate the little things in life.";
  final DateTime date = DateTime(2023, 5, 15);

  DiaryViewPage({super.key});

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
            DiaryDate(date: date),
            kHeight15,
            DiaryTitle(title: title),
            kHeight15,
            Expanded(child: DiaryContent(content: content)),
          ],
        ),
      ),
    );
  }
}
