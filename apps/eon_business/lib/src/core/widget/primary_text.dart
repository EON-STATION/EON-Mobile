import 'package:flutter/material.dart';

/// {@template primary_text}
/// PrimaryText widget.
/// {@endtemplate}
class PrimaryText extends StatelessWidget {
  /// {@macro primary_text}
  const PrimaryText({
    required this.data,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.color,
    super.key, // ignore: unused_element
  });

  final String data;

  final TextAlign? textAlign;

  final TextOverflow? overflow;

  final int? maxLines;

  final Color? color;

  factory PrimaryText.medium({required String data, TextAlign? textAlign}) {
    return PrimaryText(data: data, textAlign: textAlign);
  }

  factory PrimaryText.bold({
    required String data,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Color? color,
  }) {
    return PrimaryText(data: data, textAlign: textAlign, overflow: overflow, maxLines: maxLines, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return Text(data, textAlign: textAlign, overflow: overflow, maxLines: maxLines);
  }
}
