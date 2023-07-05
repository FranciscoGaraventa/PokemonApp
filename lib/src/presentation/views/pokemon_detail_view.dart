import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon_app/src/presentation/blocs/pokemon_controller.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/dimens.dart';
import '../blocs/pokemon_database_controller.dart';
import '../blocs/pokemon_evolution_controller.dart';
import '../../config/route/named_route.dart';
import '../../core/utils/colors.dart';
import '../../domain/entities/stat.dart';
import '../widgets/pokemon_base_text.dart';
import '../../domain/entities/pokemon.dart';
import '../widgets/pokemon_image.dart';
import '../widgets/pokemon_types.dart';

class PokemonDetailView extends StatefulWidget {
  const PokemonDetailView({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView>
    with SingleTickerProviderStateMixin {
  static const positionedZero = 0.0;
  static const statValueWidth = 200.0;
  static const statValueHeight = 20.0;
  static const maxStatValue = 100.0;
  static const statBarColorOpacity = 0.3;
  static const backgroundColorOpacity = 0.4;
  static const gridDelegateCrossAxisCount = 2;
  static const emptyStateAssetSize = 100.0;
  static const tabBarIndicatorHeight = 3.0;
  static const cardElevation = 1.0;
  static const pokemonImageProviderScale = 0.5;
  static const tabControllerLength = 2;
  static const emptyStateMessage = 'No evolutions found';
  static const statsLabel = 'Stats';
  static const evolutionsLabel = 'Evolutions';
  static const pokemonSavedText = 'Pokemon catched!';

  final PokemonController pokemonController = Get.find<PokemonController>();
  final PokemonEvolutionController pokemonEvolutionController =
      Get.find<PokemonEvolutionController>();
  final PokemonDatabaseController pokemonDatabaseController =
      Get.find<PokemonDatabaseController>();

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: tabControllerLength,
      vsync: this,
    );

    pokemonController.setPokemonDetailSelection(
      id: widget.pokemon.id,
      isSaved: pokemonDatabaseController.favorites.value
              .firstWhereOrNull((id) => id == widget.pokemon.id) !=
          null,
    );

    tabController.addListener(() {
      if (tabController.index == 1) {
        pokemonEvolutionController.getPokemonEvolutions(id: widget.pokemon.id);
      }
    });
  }

  Widget _buildPokemonImage() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.4,
        child: PokemonImage(
          sprites: widget.pokemon.sprites,
          officialArtworkUrl:
              widget.pokemon.sprites.other?.officialArtwork.frontDefault,
          imageProviderScale: pokemonImageProviderScale,
        ),
      ),
    );
  }

  Widget _buildStat({required Stat stat}) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: CustomPadding.paddingXSmall),
      child: Row(
        children: [
          Expanded(
            child: Text(
              stat.stat.name.capitalize!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: statValueWidth,
            child: Stack(
              children: [
                Container(
                  height: statValueHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(
                      CustomBorderRadius.borderRadiusMedium,
                    ),
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Text(
                      '${stat.baseStat}/100',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: statValueHeight,
                  width: statValueWidth * (stat.baseStat / maxStatValue),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      CustomBorderRadius.borderRadiusMedium,
                    ),
                    color: ColorUtils.getColorByPokemonType(
                            typeName: widget.pokemon.types.first.type.name)
                        .withOpacity(statBarColorOpacity),
                  ),
                  child: const SizedBox.shrink(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPokemonStats({required List<Stat> stats}) {
    return ListView.builder(
      itemCount: stats.length,
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return _buildStat(stat: stats[index]);
      },
    );
  }

  Widget _buildPokemonEvolutions({required List<Pokemon> evolutions}) {
    return GridView.builder(
      itemCount: evolutions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridDelegateCrossAxisCount,
        crossAxisSpacing: CustomPadding.paddingSmall,
        mainAxisSpacing: CustomPadding.paddingSmall,
      ),
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return InkWell(
          onTap: () {
            Get.find<GlobalKey<NavigatorState>>()
                .currentState
                ?.pushReplacementNamed(
              NamedRoute.pokemonDetailView,
              arguments: {'pokemon': evolutions[index]},
            );
          },
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: cardElevation,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(CustomBorderRadius.borderRadiusXMedium),
              ),
            ),
            child: PokemonImage(
              sprites: evolutions[index].sprites,
              officialArtworkUrl:
                  evolutions[index].sprites.other?.officialArtwork.frontDefault,
              imageProviderScale: pokemonImageProviderScale,
            ),
          ),
        );
      },
    );
  }

  Widget _buildEvolutions() {
    return pokemonEvolutionController.obx(
      (state) => _buildPokemonEvolutions(evolutions: state!),
      onLoading: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CustomPadding.paddingXBig,
          vertical: CustomPadding.paddingXBig,
        ),
        child: Lottie.asset(
          Assets.pokeBallLottie,
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
      ),
      onError: (error) => const SizedBox.shrink(),
      onEmpty: _buildEmptyEvolutionList(),
    );
  }

  Widget _buildEmptyEvolutionList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.professorImage,
            fit: BoxFit.contain,
            width: emptyStateAssetSize,
            height: emptyStateAssetSize,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: CustomPadding.paddingSmall),
            child: Text(
              emptyStateMessage,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: CustomTextFontSize.fontSizeMedium,
                color: ColorUtils.getColorByPokemonType(
                    typeName: widget.pokemon.types.first.type.name),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPokemonDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: CustomPadding.paddingBig,
        horizontal: CustomPadding.paddingSmall,
      ),
      child: Column(
        children: [
          PokemonTypes(types: widget.pokemon.types),
          TabBar(
            controller: tabController,
            indicatorWeight: tabBarIndicatorHeight,
            indicatorColor: ColorUtils.getColorByPokemonType(
                typeName: widget.pokemon.types.first.type.name),
            tabs: const [
              Tab(
                child: Text(
                  statsLabel,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  evolutionsLabel,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Center(child: _buildPokemonStats(stats: widget.pokemon.stats)),
                Center(child: _buildEvolutions()),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: ColorUtils.getColorByPokemonType(
                typeName: widget.pokemon.types.first.type.name),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PokemonBaseText(
                  text: widget.pokemon.name,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: CustomPadding.paddingSmall),
                  child: Text(
                    widget.pokemon.formatPokemonId(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: CustomTextFontSize.fontSizeMedium,
                    ),
                  ),
                )
              ],
            ),
            centerTitle: true,
            actions: [
              pokemonController.isPokemonSaved.value == false
                  ? IconButton(
                      onPressed: () {
                        pokemonController.setPokemonDetailSelection(
                          id: widget.pokemon.id,
                          isSaved: true,
                        );
                        pokemonDatabaseController.savePokemon(
                          pokemon: widget.pokemon,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: ColorUtils.getColorByPokemonType(
                                typeName: widget.pokemon.types.first.type.name),
                            content: const Text(
                              pokemonSavedText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: CustomTextFontSize.fontSizeXSmall,
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.catching_pokemon_outlined),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          body: Container(
            color: ColorUtils.getColorByPokemonType(
                    typeName: widget.pokemon.types.first.type.name)
                .withOpacity(backgroundColorOpacity),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  left: positionedZero,
                  right: positionedZero,
                  child: Padding(
                    padding: const EdgeInsets.all(CustomPadding.paddingLarge),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(CustomBorderRadius.borderRadiusLarge),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: _buildPokemonDetails(),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: _buildPokemonImage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
