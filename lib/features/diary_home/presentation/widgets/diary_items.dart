import 'package:diary_app/features/diary_home/presentation/widgets/diary_entry.dart';
import 'package:diary_app/features/diary_home/presentation/widgets/diary_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../diary_feed_cubit/diary_feed_cubit.dart';

class DiaryItems extends StatelessWidget {
  const DiaryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiaryFeedCubit, DiaryFeedState>(
      builder: (context, state) {
        if (state is DiaryFeedSuccess) {
          if (state.myDiaries.isEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/diary.png',
                  width: 250,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Looks like your diary is empty!\nNo secrets? 🤔 🤔",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ));
          }
          return Expanded(
            child: ListView.builder(
              itemCount: state.myDiaries.length,
              itemBuilder: (context, index) {
                return DiaryEntry(
                  index: index,
                  diary: state.myDiaries[index],
                );
              },
            ),
          );
        }

        ///its better to show  better animation
        ///or something when error occurs
        ///for simplicity i did this
        if (state is DiaryFailure) {
          return Text(state.failureMsg);
        }
        return const DiaryEntryShimmer();
      },
      listener: (context, state) {},
    );
  }
}
