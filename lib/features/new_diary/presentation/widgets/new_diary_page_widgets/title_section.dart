// import 'package:diary_app/core/extensions/date_format.dart';
// import 'package:diary_app/features/new_diary/presentation/widgets/input_field.dart';
// import 'package:flutter/material.dart';

// class TitleSection extends StatelessWidget {
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController titleController = TextEditingController();
//   TitleSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InputField(
//           isEnabled: false,
//           hintText: DateTime.now().formatToMMMddyyyy(),
//           controller: dateController,
//           leadingIcon: const Icon(Icons.calendar_month),
//         ),
//         InputField(
//           hintText: 'Title',
//           controller: titleController,
//         ),
//       ],
//     );
//   }
// }
