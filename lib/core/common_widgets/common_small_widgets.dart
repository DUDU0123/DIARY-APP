import 'package:diary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

Widget commonPersonIcon() {
  return const Icon(
    Icons.person,
    size: 30,
    color: kBlack,
  );
}

Image commonImageShowWidget({required String? image}) {
  return Image.network(
    fit: BoxFit.cover,
    image ?? '',
    errorBuilder: (context, error, stackTrace) {
      return Center(
        child: Icon(
          Icons.person,
          size: 50,
          color: kBlack.withOpacity(0.5),
        ),
      );
    },
  );
}
