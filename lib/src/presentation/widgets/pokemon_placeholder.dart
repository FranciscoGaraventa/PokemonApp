import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/dimens.dart';

class PokemonPlaceholder extends StatefulWidget {
  const PokemonPlaceholder({Key? key}) : super(key: key);

  @override
  State<PokemonPlaceholder> createState() => _PokemonPlaceholderState();
}

class _PokemonPlaceholderState extends State<PokemonPlaceholder> {
  static const itemCount = 8;

  static const gridDelegateCrossAxisCount = 2;
  static const cardElevation = 5.0;
  static const lottieAssetRoute = 'assets/lottie/pokeball.json';

  Widget _cardPlaceHolder() {
    return Card(
      elevation: cardElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(CustomBorderRadius.borderRadiusXMedium),
        ),
      ),
      child: GridTile(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CustomPadding.paddingXBig,
            vertical: CustomPadding.paddingXBig,
          ),
          child: Lottie.asset(
            lottieAssetRoute,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomPadding.paddingSmall),
      child: GridView.builder(
        itemCount: itemCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridDelegateCrossAxisCount,
          crossAxisSpacing: CustomPadding.paddingSmall,
          mainAxisSpacing: CustomPadding.paddingSmall,
        ),
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return _cardPlaceHolder();
        },
      ),
    );
  }
}
