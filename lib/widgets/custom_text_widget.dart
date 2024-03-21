
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String? label;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CustomTextWidget({
    this.label,
    this.fontSize,
    this.fontWeight,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}