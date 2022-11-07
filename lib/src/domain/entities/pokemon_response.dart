import 'property.dart';

class PokemonResponse {
  PokemonResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<Property> results;
}
