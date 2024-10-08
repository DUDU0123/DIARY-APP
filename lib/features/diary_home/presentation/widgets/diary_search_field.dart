import 'package:diary_app/core/common_widgets/text_field_common_widget.dart';
import 'package:diary_app/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:diary_app/features/diary_home/presentation/diary_feed_cubit/diary_feed_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiarySearchField extends StatelessWidget {
  const DiarySearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFieldCommon(
              onChanged: (String val) {
                return context.read<DiaryFeedCubit>().searchDiaries(val);
              },
              hintText: 'Search',
              textAlign: TextAlign.left,
              border: InputBorder.none,
            ),
          ),
          const Icon(Icons.search, color: Colors.grey),
        ],
      ),
    );
  }
}
