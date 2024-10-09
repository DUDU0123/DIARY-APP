import 'package:diary_app/features/new_diary/presentation/widgets/add_button.dart';
import 'package:diary_app/features/new_diary/presentation/widgets/diary_line.dart';
import 'package:flutter/material.dart';

class DiaryPage extends StatelessWidget {
  final List<TextEditingController> controllers;
  final Function() onSave;
  const DiaryPage({super.key, required this.controllers, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return DiaryLine(
                  controller: controllers[index],
                );
              },
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: AddButton(
                onPressed: onSave,
              )),
        ],
      ),
    );
  }
}
