
import 'package:diary_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

LinearGradient commonGradientColor() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      kAmber.withOpacity(0.4),
      kYellow.withOpacity(0.6),
    ],
  );
}