import 'package:diary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final Icon? leadingIcon;
  final TextEditingController controller;
  final bool? isEnabled;
  const InputField(
      {super.key,
      this.hintText,
      this.leadingIcon,
      required this.controller,
      this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: kLightYellowColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                leadingIcon ?? const SizedBox(),
                Expanded(
                  child: TextField(
                    enabled: isEnabled ?? true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
