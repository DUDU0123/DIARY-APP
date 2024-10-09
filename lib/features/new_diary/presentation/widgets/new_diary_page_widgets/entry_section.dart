import 'package:diary_app/core/extensions/date_format.dart';
import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/features/new_diary/presentation/bloc/diary_manager/diary_manager_bloc.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/diary_entry_field.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class EntrySection extends StatefulWidget {
  final Diary? diary;

  const EntrySection({
    Key? key,
    this.diary,
  }) : super(key: key);

  @override
  _EntrySectionState createState() => _EntrySectionState();
}

class _EntrySectionState extends State<EntrySection> {
  late TextEditingController contentController;
  late TextEditingController dateController;
  late TextEditingController titleController;

  late FocusNode titleFocusNode;
  late FocusNode contentFocusNode;

  @override
  void initState() {
    super.initState();

    contentController =
        TextEditingController(text: widget.diary?.content ?? "");
    dateController = TextEditingController(
      text: widget.diary?.createdAt.formatToMMMddyyyy() ??
          DateTime.now().formatToMMMddyyyy(),
    );
    titleController = TextEditingController(text: widget.diary?.title ?? "");

    titleFocusNode = FocusNode();
    contentFocusNode = FocusNode();

    titleFocusNode.addListener(() {
      if (!titleFocusNode.hasFocus) {
        FocusScope.of(context).requestFocus(contentFocusNode);
      }
    });
  }

  @override
  void dispose() {
    contentController.dispose();
    dateController.dispose();
    titleController.dispose();

    titleFocusNode.dispose();
    contentFocusNode.dispose();
    super.dispose();
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
          onchanged: (value) {},
        ),
        InputField(
          hintText: 'Title',
          controller: titleController,
          focusNode: titleFocusNode,
          onchanged: (value) => titleController.text = value,
        ),
        Expanded(
          child: DiaryEntryField(
            contentController: contentController,
            focusNode: contentFocusNode,
            onSave: () {
              onButtonPressed(context);
            },
          ),
        ),
      ],
    );
  }

  void onButtonPressed(BuildContext context) {
    Diary diaryModel = Diary(
      id: widget.diary?.id ?? const Uuid().v4(),
      title: titleController.text.trim(),
      content: contentController.text.trim(),
      createdAt: widget.diary?.createdAt ?? DateTime.now(),
    );

    context.read<DiaryManagerBloc>().add(
          widget.diary?.id == null
              ? AddDiaryEvent(diaryModel)
              : EditDiary(diaryModel),
        );
  }
}
