
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/features/diary_home/presentation/widgets/diary_entry.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/diary_home_small_widgets.dart';
import '../widgets/diary_search_field.dart';

class DiaryHomePage extends StatelessWidget {
  const DiaryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPink,
      appBar: AppBar(
        backgroundColor: kPink,
        title: diaryHomeAppBarTitle(),
        actions: [
          userProfileNavigateIcon(),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // CreateDiary(),
            kHeight15,
            DiarySearchField(),
            kHeight15,
            Text('Recents',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            kHeight10,
            DiaryEntry(index: 0),
            DiaryEntry(index: 1),
            DiaryEntry(index: 2),
            DiaryEntry(index: 3),
          ],
        ),
      ),
    );
  }
}
