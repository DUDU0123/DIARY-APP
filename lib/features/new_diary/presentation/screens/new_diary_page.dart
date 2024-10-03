import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/input_field.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/new_diary_input.dart';
import 'package:flutter/material.dart';

class NewDiaryPage extends StatelessWidget {
  const NewDiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPink,
      appBar: AppBar(
        backgroundColor: kPink,
        leading: const Icon(Icons.arrow_back_ios),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.cancel,
              color: kRed,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const InputField(
            hintText: 'Date',
            leadingIcon: Icon(Icons.calendar_month),
          ),
          const InputField(
            hintText: 'Title',
          ),
          Expanded(child: DiaryPage())
        ],
      )),
    );
  }
}
