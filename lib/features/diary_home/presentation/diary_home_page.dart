import 'package:diary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DiaryHomePage extends StatelessWidget {
  const DiaryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            decoration: const BoxDecoration(
              color: kWhite,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.person,
                color: kBlack,
              ),
            ),
          )
        ],
      ),
    );
  }
}
