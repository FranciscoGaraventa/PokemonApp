import 'package:flutter/material.dart';

import '../../config/theme/app_themes.dart';

class PokemonBaseText extends StatelessWidget {
  const PokemonBaseText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: pageTextStyleBorder,
        ),
        Text(
          text,
          style: pageTextStyle,
        ),
      ],
    );
  }
}
