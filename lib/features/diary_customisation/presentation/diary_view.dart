import 'package:diary_app/core/common_entity/diary.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_content.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_date.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_title.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_view_page.dart/app_bar.dart';
import 'package:diary_app/features/diary_customisation/presentation/widgets/diary_view_page.dart/snack_bar.dart';
import 'package:diary_app/features/new_diary/presentation/bloc/diary_manager/diary_manager_bloc.dart';
import 'package:diary_app/features/new_diary/presentation/screens/new_diary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

class DiaryViewPage extends StatelessWidget {
  final Diary diary;

  const DiaryViewPage({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DiaryManagerBloc, DiaryManagerState>(
      listener: (context, state) {
        if (state is DiaryDeleted) {
          Navigator.pop(context);
          showSnackBar(context, 'Diary Deleted');
        } else if (state is DiaryDeleteFailed) {
          showSnackBar(context, 'Failed to delete diary');
        }
      },
      child: Scaffold(
        backgroundColor: kPink,
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  DiaryViewAppBar _buildAppBar(BuildContext context) {
    return DiaryViewAppBar(
      diary: diary,
      onDeletePressed: onDeletePressed,
      onEditPressed: () => onEditPressed(context),
    );
  }

  Column _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DiaryDate(date: diary.createdAt),
        kHeight15,
        DiaryTitle(title: diary.title),
        kHeight15,
        Expanded(child: DiaryContent(content: diary.content)),
      ],
    );
  }

  void onEditPressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => NewDiaryAddPage(diary: diary),
      ),
    );
  }

  void onDeletePressed(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Delete Diary',
      text: 'Are you sure you want to delete this diary entry?',
      confirmBtnText: 'Delete',
      cancelBtnText: 'Cancel',
      confirmBtnColor: Colors.red,
      onCancelBtnTap: () => Navigator.pop(context),
      onConfirmBtnTap: () {
        context.read<DiaryManagerBloc>().add(DeleteDiary(diary.id));
        Navigator.pop(context);
      },
    );
  }
}
