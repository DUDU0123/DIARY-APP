import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgetCommon extends StatelessWidget {
  const TextWidgetCommon({
    super.key,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.softWrap,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    required this.text,
    this.fontStyle,
    this.fontFamily,
  });

  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool? softWrap;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final String text;
  final FontStyle? fontStyle;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      text,
      style: GoogleFonts.alegreyaSansSc(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
        fontStyle: fontStyle,
      ),
    );
  }
}
