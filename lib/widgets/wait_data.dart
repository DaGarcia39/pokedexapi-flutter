import 'package:flutter/material.dart';
import 'package:bloc_pokemon_api/bloc/pokemonBloc.dart';

final pokemonBloc = PokemonBloc();

class WaitData extends StatelessWidget {
  const WaitData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                pokemonBloc.getDataPokemon();
              },
              child: Text(
                'Get data',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.lightBlueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
