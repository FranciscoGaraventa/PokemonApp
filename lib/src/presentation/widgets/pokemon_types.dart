import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/dimens.dart';
import '../../domain/entities/type.dart';

class PokemonTypes extends StatefulWidget {
  const PokemonTypes({
    Key? key,
    required this.types,
  }) : super(key: key);

  final List<Type> types;

  @override
  State<PokemonTypes> createState() => _PokemonTypesState();
}

class _PokemonTypesState extends State<PokemonTypes> {
  static const pokemonTypeCrossAxisCount = 3;
  static const pokemonTypeMainAxisSpacing = 4.0;
  static const pokemonTypeCrossAxisSpacing = 4.0;

  Widget _buildType({required String typeName}) {
    return Padding(
      padding: const EdgeInsets.all(CustomPadding.paddingSmall),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            CustomBorderRadius.borderRadiusMedium,
          ),
          color: ColorUtils.getColorByPokemonType(typeName: typeName),
        ),
        child: Padding(
          padding: const EdgeInsets.all(CustomPadding.paddingXSmall),
          child: Text(
            typeName.capitalize!,
            style: const TextStyle(
                color: Colors.white,
                fontSize: CustomTextFontSize.fontSizeMedium,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      itemCount: widget.types.length,
      crossAxisCount: widget.types.length < pokemonTypeCrossAxisCount
          ? widget.types.length
          : pokemonTypeCrossAxisCount,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      mainAxisSpacing: pokemonTypeMainAxisSpacing,
      crossAxisSpacing: pokemonTypeCrossAxisSpacing,
      itemBuilder: (BuildContext context, int index) =>
          _buildType(typeName: widget.types[index].type.name),
    );
  }
}
