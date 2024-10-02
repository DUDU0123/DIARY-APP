import 'package:diary_app/features/diary_home/presentation/widgets/diary_home_small_widgets.dart';
import 'package:flutter/material.dart';

class DiaryHomePage extends StatelessWidget {
  const DiaryHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: diaryHomeAppBarTitle(),
        actions: [
          userProfileNavigateIcon(),
        ],
      ),
    );
  }
}
