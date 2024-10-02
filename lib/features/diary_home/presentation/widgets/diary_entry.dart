import 'package:diary_app/core/constants/height_width.dart';
import 'package:diary_app/features/diary_customisation/presentation/diary_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class DiaryEntry extends StatelessWidget {
  const DiaryEntry({super.key, required this.index});
  final int index;
  Color _getColor(int index) {
    switch (index % 3) {
      case 0:
        return kCustomPink200;
      case 1:
        return kCustomGreen100;
      case 2:
        return kCustomBlue100;
      default:
        return kCustomPink100;
    }
  }

  IconData _getIcon(int index) {
    switch (index % 3) {
      case 0:
        return Icons.local_florist;
      case 1:
        return Icons.favorite;
      case 2:
        return Icons.sentiment_satisfied_alt;
      default:
        return Icons.local_florist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DiaryViewPage()));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: _getColor(index),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(_getIcon(index), color: Colors.red),
                  kWidth10,
                  const Text(
                    '3/07/2004',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.black54,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
