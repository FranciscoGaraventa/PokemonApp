import 'property.dart';

class Chain {
  Chain({
    required this.evolution,
    required this.isBaby,
    required this.species,
});

  final List<Chain> evolution;
  final bool isBaby;
  final Property species;
}
