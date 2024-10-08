import 'package:diary_app/core/service_locator/service_locator.dart';
import 'package:diary_app/features/new_diary/presentation/bloc/diary_manager/diary_manager_bloc.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/new_diary_page_widgets/entry_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<DiaryManagerBloc>(),
      child: BlocListener<DiaryManagerBloc, DiaryManagerState>(
        listener: (context, state) {
          if (state is DiaryAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Diary entry added!')));
          } else if (state is DiaryAddingFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Failed to add')));
          }
        },
        child: Column(
          children: [
            // const InputField(
            //   controller: ,
            //   hintText: 'Date',
            //   leadingIcon: Icon(Icons.calendar_month),
            // ),
            // const InputField(
            //   hintText: 'Title',
            // ),
            EntrySection(),
          ],
        ),
      ),
    );
  }
}
