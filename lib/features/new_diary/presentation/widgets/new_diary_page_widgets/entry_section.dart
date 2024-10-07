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
  final Diary? diary;
  late TextEditingController contentController;
  late TextEditingController dateController;
  late TextEditingController titleController;

  EntrySection({
    super.key,
    this.diary,
  }) {
    contentController = TextEditingController(text: diary?.content ?? "");
    dateController = TextEditingController(
        text: diary?.createdAt.formatToMMMddyyyy() ??
            DateTime.now().formatToMMMddyyyy());
    contentController = TextEditingController(text: diary?.content ?? "");
    titleController = TextEditingController(text: diary?.title ?? "");
  }
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
            onButtonPressed(context);
          },
        )),
      ],
    );
  }

  void onButtonPressed(BuildContext context) {
    // Creates a new Diary model based on the input data from the text controllers.
    Diary diaryModel = Diary(
      id: diary?.id ?? const Uuid().v4(),
      title: titleController.text.trim(),
      content: contentController.text.trim(),
      createdAt: diary?.createdAt ?? DateTime.now(),
    );

    //If the diary already exists (has an ID), triggers an EditDiary event; otherwise, triggers an AddDiaryEvent.
    context.read<DiaryManagerBloc>().add(
          diary?.id == null ? AddDiaryEvent(diaryModel) : EditDiary(diaryModel),
        );
  }
}
