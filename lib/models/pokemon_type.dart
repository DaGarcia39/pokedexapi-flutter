import 'package:flutter/material.dart';

class PokemonType {
  PokemonType({this.type});
  final String type;

  getPokemonType(String type) {
    if (type == 'normal') {
      return {
        'name': 'normal',
        'color': Color(0xFFE5E8E8),
      };
    } else if (type == 'electric') {
      return {
        'name': 'electric',
        'color': Color(0xFFF7DC6F),
      };
    } else if (type == 'bug') {
      return {
        'name': 'bug',
        'color': Color(0xFF52BE80),
      };
    } else if (type == 'water') {
      return {
        'name': 'water',
        'color': Color(0xFF5DADE2),
      };
    } else if (type == 'fire') {
      return {
        'name': 'fire',
        'color': Color(0xFFE67E22),
      };
    }
  }
}
