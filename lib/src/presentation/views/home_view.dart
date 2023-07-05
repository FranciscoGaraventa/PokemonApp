import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/assets.dart';
import '../blocs/pokemon_database_controller.dart';
import '../../config/route/named_route.dart';
import '../../core/utils/dimens.dart';
import '../../domain/entities/pokemon.dart';
import '../blocs/pokemon_controller.dart';
import '../widgets/pokemon_base_text.dart';
import '../widgets/pokemon_image.dart';
import '../widgets/pokemon_placeholder.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const gridDelegateCrossAxisCount = 2;
  static const cardElevation = 5.0;
  static const gridTileFooterHeight = 50.0;
  static const bottomNavigationBarHeight = 40.0;
  static const assetImageSize = 50.0;
  static const nextButtonLabel = 'NEXT';
  static const previousButtonLabel = 'PREVIOUS';

  final pokemonController = Get.find<PokemonController>();
  final pokemonDatabaseController = Get.find<PokemonDatabaseController>();

  @override
  void initState() {
    pokemonController.getPokemons(pageType: PageType.initialPage);
    super.initState();
  }

  Widget _buildPokemonGridView({required List<Pokemon> pokemons}) {
    return Padding(
      padding: const EdgeInsets.all(CustomPadding.paddingSmall),
      child: GridView.builder(
        itemCount: pokemons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridDelegateCrossAxisCount,
          crossAxisSpacing: CustomPadding.paddingSmall,
          mainAxisSpacing: CustomPadding.paddingSmall,
        ),
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Obx(
            () => InkWell(
              onTap: () =>
                  Get.find<GlobalKey<NavigatorState>>().currentState?.pushNamed(
                NamedRoute.pokemonDetailView,
                arguments: {'pokemon': pokemons[index]},
              ),
              child: Stack(
                children: [
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: cardElevation,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(CustomBorderRadius.borderRadiusXMedium),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: PokemonImage(
                            sprites: pokemons[index].sprites,
                          ),
                        ),
                        Container(
                          height: gridTileFooterHeight,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                  CustomBorderRadius.borderRadiusXMedium),
                              bottomRight: Radius.circular(
                                  CustomBorderRadius.borderRadiusXMedium),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: CustomPadding.paddingSmall),
                              child: PokemonBaseText(
                                text: pokemons[index].name.toUpperCase(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pokemonDatabaseController.favorites.value.firstWhereOrNull(
                              (id) => id == pokemons[index].id) !=
                          null
                      ? Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 50.0,
                            child: Image.asset('assets/gotcha.png'),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset(
          Assets.pokemonLogo,
          height: assetImageSize,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () =>
                Get.find<GlobalKey<NavigatorState>>().currentState?.pushNamed(
                      NamedRoute.favoritesView,
                    ),
            icon: Image.asset(Assets.favoriteIcon),
          )
        ],
      ),
      body: Center(
        child: pokemonController.obx(
          (state) => _buildPokemonGridView(pokemons: state!),
          onError: (error) => Text(error.toString()),
          onLoading: const PokemonPlaceholder(),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.red,
        height: bottomNavigationBarHeight,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CustomPadding.paddingMedium,
                ),
                child: AbsorbPointer(
                  absorbing: !(pokemonController.previousPageUrl.value != null),
                  child: InkWell(
                    onTap: () => pokemonController.getPokemons(
                      pageType: PageType.previousPage,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: pokemonController.previousPageUrl.value != null
                          ? const PokemonBaseText(
                              text: previousButtonLabel,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CustomPadding.paddingMedium,
                ),
                child: InkWell(
                  onTap: () => pokemonController.getPokemons(
                    pageType: PageType.nextPage,
                  ),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: PokemonBaseText(
                      text: nextButtonLabel,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
