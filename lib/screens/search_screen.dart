import 'package:bloc_pokemon_api/bloc/pokemonBloc.dart';
import 'package:bloc_pokemon_api/models/pokemon.dart';
import 'package:bloc_pokemon_api/widgets/car_initial_progress.dart';
import 'package:bloc_pokemon_api/widgets/show_pokemon_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'SearchScreen';
  final pokemonBloc = PokemonBloc();

  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedUser;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        widget.pokemonBloc.getDataPokemon();
      });
    });
    getCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
    // widget.pokemonBloc.dispose();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedUser = user;
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Pokemon>(
      stream: widget.pokemonBloc.dataPokemonStream,
      builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) {
        final pokemonData = snapshot.data;
        if (pokemonData == null) {
          // return BarProgressIndicator();
          return CardInitialProgress(pokemonData, widget.pokemonBloc);
        } else if (snapshot.hasError) {
          Alert(context: context, title: 'No existe').show();
        }
        return ShowPokemonInformation(pokemonData, widget.pokemonBloc);
      },
    );
  }
}
