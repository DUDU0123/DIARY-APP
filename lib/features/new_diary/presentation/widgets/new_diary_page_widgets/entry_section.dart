import 'package:diary_app/core/extensions/date_format.dart';
import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/features/new_diary/presentation/bloc/diary_manager/diary_manager_bloc.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/diary_entry_field.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class EntrySection extends StatelessWidget {
  TextEditingController contentController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  EntrySection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(
          isEnabled: false,
          hintText: DateTime.now().formatToMMMddyyyy(),
          controller: dateController,
          leadingIcon: const Icon(Icons.calendar_month),
        ),
        InputField(
          hintText: 'Title',
          controller: titleController,
        ),
        Expanded(
            child: DiaryEntryField(
          contentController: contentController,
          onSave: () {
            Diary diary = Diary(
                id: const Uuid().v4(),
                title: titleController.text.trim(),
                content: contentController.text.trim(),
                createdAt: DateTime.now());
            context.read<DiaryManagerBloc>().add(AddDiaryEvent(diary));
          },
        )),
      ],
    );
  }
}
