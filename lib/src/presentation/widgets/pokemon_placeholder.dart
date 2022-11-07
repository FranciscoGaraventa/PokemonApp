import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
  static const gridTileFooterHeight = 30.0;

  Widget _cardPlaceHolder() {
    return Card(
      elevation: cardElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(CustomBorderRadius.borderRadiusXMedium),
        ),
      ),
      child: GridTile(
        footer: Shimmer.fromColors(
          baseColor: Colors.grey.shade700,
          highlightColor: Colors.grey.shade300,
          child: Container(
            height: gridTileFooterHeight,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(CustomBorderRadius.borderRadiusXMedium),
                bottomRight:
                    Radius.circular(CustomBorderRadius.borderRadiusXMedium),
              ),
            ),
          ),
        ),
        child: const SizedBox.shrink(),
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
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade300,
            child: _cardPlaceHolder(),
          );
        },
      ),
    );
  }
}
