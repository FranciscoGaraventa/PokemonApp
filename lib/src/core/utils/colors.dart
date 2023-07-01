import 'package:flutter/material.dart';

abstract class ColorUtils {
  static Color getColorByPokemonType({required String typeName}) {
    switch(typeName) {
      case 'grass': return Colors.green;
      case 'fire': return Colors.orangeAccent;
      case 'flying': return Colors.lightBlue;
      case 'water': return Colors.lightBlue;
      case 'bug': return Colors.brown;
      case 'ice': return Colors.blue;
      case 'normal': return Colors.grey;
      case 'rock': return Colors.blueGrey;
      case 'poison': return Colors.deepPurple;
      case 'electric': return Colors.yellow;
      case 'ground': return Colors.brown;
      case 'fairy': return Colors.pinkAccent;
      case 'steel': return Colors.indigo;
      case 'dragon': return Colors.redAccent;
      default: return Colors.blueGrey.shade800;
    }
  }
}
