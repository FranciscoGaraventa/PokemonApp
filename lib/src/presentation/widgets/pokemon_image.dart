import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/sprites.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    Key? key,
    required this.sprites,
    this.officialArtworkUrl,
    this.imageProviderScale = defaultImageProviderScale,
    this.assetImageSize = defaultAssetImageSize,
  }) : super(key: key);

  final Sprites sprites;
  final String? officialArtworkUrl;
  final double imageProviderScale;
  final double assetImageSize;

  static const defaultImageProviderScale = 0.6;
  static const defaultAssetImageSize = 50.0;
  static const cardPlaceHolderAssetImage = 'assets/pikachu_placeholder.png';

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          officialArtworkUrl ?? (sprites.frontDefault ?? sprites.frontFemale!),
      imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            scale: imageProviderScale,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      placeholder: (context, url) => Center(
        child: Image.asset(
          cardPlaceHolderAssetImage,
          fit: BoxFit.cover,
          width: assetImageSize,
          height: assetImageSize,
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
