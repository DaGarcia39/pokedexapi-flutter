import 'package:bloc_pokemon_api/models/pokemon.dart';
import 'package:flutter/material.dart';

class ListSavePokemon extends StatelessWidget {
  ListSavePokemon({
    this.pokemonBloc,
    this.pokemonData,
    this.idPokemon,
    this.image,
  });

  final Pokemon pokemonData;
  final pokemonBloc;
  final idPokemon;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.lightBlueAccent,
        ),
        color: Colors.black45,
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          tileMode: TileMode.clamp,
          colors: [
            Color(0xFFED1C22),
            Color(0xFF024A86),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          pokemonBloc.getDataPokemon(namePokemon: '$idPokemon');
        },
        child: Image.network(image),
      ),
    );
  }
}
