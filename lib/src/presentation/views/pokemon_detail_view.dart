import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon_app/src/core/utils/dimens.dart';
import 'package:pokemon_app/src/presentation/blocs/pokemon_evolution_controller.dart';

import '../../config/route/named_route.dart';
import '../../core/utils/colors.dart';
import '../../domain/entities/stat.dart';
import '../widgets/pokemon_base_text.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/entities/type.dart';
import '../widgets/pokemon_image.dart';

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
  static const pokemonTypeCrossAxisCount = 3;
  static const pokemonTypeMainAxisSpacing = 4.0;
  static const pokemonTypeCrossAxisSpacing = 4.0;
  static const backgroundColorOpacity = 0.4;
  static const gridDelegateCrossAxisCount = 2;
  static const emptyStateAssetSize = 100.0;
  static const lottieAssetRoute = 'assets/lottie/pokeball.json';
  static const emptyStateAssetRoute = 'assets/professor_oak.png';
  static const emptyStateMessage = 'No evolutions found';

  final PokemonEvolutionController pokemonEvolutionController =
      Get.find<PokemonEvolutionController>();

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
          imageProviderScale: 0.5,
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

  Widget _buildPokemonTypes({required List<Type> types}) {
    return AlignedGridView.count(
      itemCount: types.length,
      crossAxisCount: types.length < pokemonTypeCrossAxisCount
          ? types.length
          : pokemonTypeCrossAxisCount,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      mainAxisSpacing: pokemonTypeMainAxisSpacing,
      crossAxisSpacing: pokemonTypeCrossAxisSpacing,
      itemBuilder: (BuildContext context, int index) =>
          _buildType(typeName: types[index].type.name),
    );
  }

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
            Get.find<GlobalKey<NavigatorState>>().currentState?.pushReplacementNamed(
              NamedRoute.pokemonDetailView,
              arguments: {'pokemon': evolutions[index]},
            );
          },
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 1.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(CustomBorderRadius.borderRadiusXMedium),
              ),
            ),
            child: PokemonImage(
              sprites: evolutions[index].sprites,
              officialArtworkUrl:
                  evolutions[index].sprites.other?.officialArtwork.frontDefault,
              imageProviderScale: 0.5,
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
          lottieAssetRoute,
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
            emptyStateAssetRoute,
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
          _buildPokemonTypes(types: widget.pokemon.types),
          TabBar(
            controller: tabController,
            indicatorWeight: 3.0,
            indicatorColor: ColorUtils.getColorByPokemonType(
                typeName: widget.pokemon.types.first.type.name),
            tabs: const [
              Tab(
                child: Text(
                  'Stats',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Evolutions',
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
      child: Scaffold(
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
                padding: const EdgeInsets.symmetric(
                    horizontal: CustomPadding.paddingSmall),
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
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.catching_pokemon_outlined),
            )
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
    );
  }
}
