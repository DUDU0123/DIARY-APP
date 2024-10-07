import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/core/common_widgets/common_loading.dart';
import 'package:diary_app/core/service_locator/service_locator.dart';
import 'package:diary_app/features/new_diary/presentation/bloc/diary_manager/diary_manager_bloc.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/new_diary_page_widgets/app_bar.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/new_diary_page_widgets/entry_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';

// ignore:
class NewDiaryAddPage extends StatelessWidget {
  final Diary? diary;

  const NewDiaryAddPage({Key? key, this.diary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<DiaryManagerBloc>(),
      child: BlocConsumer<DiaryManagerBloc, DiaryManagerState>(
        listener: (context, state) {
          if (state is DiaryAdded || state is DiaryEdited) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Diary entry ${state is DiaryAdded ? 'added' : 'Edited'}!')));
            Navigator.pop(context);
          } else if (state is DiaryAddingFailed || state is DiaryEditFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Failed to add')));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                backgroundColor: kPink,
                appBar: const NewDiaryAppBar(),
                body: EntrySection(
                  diary: diary,
                ),
              ),
              if (state is DiaryAdding || state is DiaryEditing)
                const OverlayLoadingHolder(),
            ],
          );
        },
      ),
    );
  }
}
