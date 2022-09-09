import 'package:bloc_pokemon_api/assets/constants/constants.dart';
import 'package:bloc_pokemon_api/models/pokemon.dart';
import 'package:flutter/material.dart';

class CardInitialProgress extends StatefulWidget {
  CardInitialProgress(this.pokemonData, this.pokemonBloc);

  final Pokemon pokemonData;
  final pokemonBloc;

  @override
  _CardInitialProgressState createState() => _CardInitialProgressState();
}

class _CardInitialProgressState extends State<CardInitialProgress> {
  final _fieldTextController = TextEditingController();
  String namePokemon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      namePokemon = value;
                      widget.pokemonBloc
                          .getDataPokemon(namePokemon: namePokemon);
                      _fieldTextController.clear();
                    },
                    decoration: kInputDecoration.copyWith(
                      icon: Icon(
                        Icons.search_outlined,
                      ),
                    ),
                    controller: _fieldTextController,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: Colors.grey,
              size: 300,
            ),
            Center(
              child: Container(
                child: Text(
                  'Look for some Pokemons!',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
