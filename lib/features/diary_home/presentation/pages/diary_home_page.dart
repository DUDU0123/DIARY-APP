import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/features/diary_home/presentation/widgets/create_diary.dart';
import 'package:diary_app/features/diary_home/presentation/widgets/diary_items.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/diary_home_small_widgets.dart';
import '../widgets/diary_search_field.dart';

class DiaryHomePage extends StatelessWidget {
  const DiaryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPink,
      appBar: AppBar(
        backgroundColor: kPink,
        title: diaryHomeAppBarTitle(),
        actions: [
          userProfileNavigateIcon(),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 28, right: 28, top: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CreateDiary(),
            kHeight15,
            DiarySearchField(),
            kHeight15,
            Text(
              'Recents',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            kHeight10,
            DiaryItems()
          ],
        ),
      ),
    );
  }
}
