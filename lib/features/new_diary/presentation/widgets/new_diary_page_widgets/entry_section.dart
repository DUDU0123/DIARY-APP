import 'dart:math';

import 'package:diary_app/features/new_diary/domain/entities/diary.dart';
import 'package:diary_app/features/new_diary/presentation/bloc/diary_manager/diary_manager_bloc.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/new_diary_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntrySection extends StatelessWidget {
  final List<TextEditingController> _controllers = List.generate(
    15,
    (index) => TextEditingController(),
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DiaryPage(
      controllers: _controllers,
      onSave: () {
        String combinedText =
            _controllers.map((controller) => controller.text).join('');
        Diary diary = Diary(
            id: '1',
            title: 'Test',
            content: combinedText,
            createdAt: DateTime.now());

        context.read<DiaryManagerBloc>().add(AddDiaryEvent(diary));
      },
    ));
  }
}
