import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/route/named_route.dart';
import '../../core/utils/assets.dart';
import '../blocs/pokemon_database_controller.dart';
import '../widgets/pokemon_types.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/dimens.dart';
import '../../domain/entities/pokemon.dart';
import '../widgets/pokemon_base_text.dart';
import '../widgets/pokemon_image.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  static const containerHeight = 100.0;
  static const deleteIconSize = 30.0;
  static const deleteContainerWidth = 40.0;
  static const backgroundColorOpacity = 0.5;
  static const appBarTitle = 'Pokedex';

  final PokemonDatabaseController pokemonDatabaseController =
      Get.find<PokemonDatabaseController>();

  @override
  void initState() {
    super.initState();
    pokemonDatabaseController.loadFavoritesPokemon();
  }

  Widget _buildFavoritePokemon({required Pokemon pokemon}) {
    return Padding(
      padding: const EdgeInsets.all(CustomPadding.paddingMedium),
      child: InkWell(
        onTap: () =>
            Get.find<GlobalKey<NavigatorState>>().currentState?.pushNamed(
          NamedRoute.pokemonDetailView,
          arguments: {'pokemon': pokemon},
        ),
        child: Container(
          height: containerHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              CustomBorderRadius.borderRadiusMedium,
            ),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                            CustomBorderRadius.borderRadiusMedium),
                        bottomLeft: Radius.circular(
                            CustomBorderRadius.borderRadiusMedium),
                      ),
                      color: ColorUtils.getColorByPokemonType(
                              typeName: pokemon.types.first.type.name)
                          .withOpacity(backgroundColorOpacity),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        CustomBorderRadius.borderRadiusMedium,
                      ),
                      color: ColorUtils.getColorByPokemonType(
                              typeName: pokemon.types.first.type.name)
                          .withOpacity(backgroundColorOpacity),
                    ),
                    child: PokemonImage(
                      sprites: pokemon.sprites,
                      officialArtworkUrl:
                          pokemon.sprites.other?.officialArtwork.frontDefault,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  color: ColorUtils.getColorByPokemonType(
                          typeName: pokemon.types.first.type.name)
                      .withOpacity(backgroundColorOpacity),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: CustomPadding.paddingSmall),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PokemonBaseText(
                          text: pokemon.name,
                        ),
                        PokemonTypes(types: pokemon.types),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: containerHeight,
                width: deleteContainerWidth,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight:
                        Radius.circular(CustomBorderRadius.borderRadiusMedium),
                    bottomRight:
                        Radius.circular(CustomBorderRadius.borderRadiusMedium),
                  ),
                  color: ColorUtils.getColorByPokemonType(
                      typeName: pokemon.types.first.type.name),
                ),
                child: InkWell(
                  onTap: () =>
                      pokemonDatabaseController.deletePokemon(pokemon: pokemon),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: deleteIconSize,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritePokemonList({required List<Pokemon> pokemonList}) {
    return Padding(
      padding: const EdgeInsets.only(top: CustomPadding.paddingMedium),
      child: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildFavoritePokemon(
            pokemon: pokemonList[index],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const PokemonBaseText(
            text: appBarTitle,
          ),
          centerTitle: true,
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.pokeDexBackgroundImage),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: pokemonDatabaseController.obx(
            (state) => _buildFavoritePokemonList(pokemonList: state!),
            onLoading: const SizedBox.shrink(),
            onEmpty: const SizedBox.shrink(),
            onError: (error) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
