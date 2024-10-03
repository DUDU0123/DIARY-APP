import 'package:diary_app/config/routes/routes_name.dart';
import 'package:diary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CreateDiary extends StatelessWidget {
  const CreateDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouteName.newDiaryPage);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: kPinkFade,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Write a New diary', style: TextStyle(fontSize: 16)),
            Image.asset(
              'assets/diary.png',
              width: 40,
            )
          ],
        ),
      ),
    );
  }
}
