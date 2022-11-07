import 'package:flutter/material.dart';
import 'package:pokemon_app/src/core/utils/dimens.dart';

final pageTextStyleBorder = TextStyle(
  fontFamily: 'Pokemon',
  fontSize: CustomTextFontSize.fontSizeMedium,
  foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 5.0
    ..color = const Color(0xFF3466AF),
);

const pageTextStyle = TextStyle(
  fontFamily: 'Pokemon',
  fontSize: CustomTextFontSize.fontSizeMedium,
  color: Color(0xFFFFCC03),
);

