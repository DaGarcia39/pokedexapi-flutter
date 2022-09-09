import 'dart:async';
import 'package:bloc_pokemon_api/bloc/bloc.dart';
import 'package:bloc_pokemon_api/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../assets/constants/constants.dart';

class PokemonBloc implements Bloc {
  // controllador
  StreamController<Pokemon> _dataPokemonController =
      StreamController<Pokemon>.broadcast();

  Stream<Pokemon> get dataPokemonStream => _dataPokemonController.stream;

  List<Map<String, dynamic>> pokemonList = [];
  //
  Future<void> getDataPokemon({String namePokemon = '1'}) async {
    String url = '$urlPokeApi/pokemon/$namePokemon';
    var urlParsed = Uri.parse(url);
    http.Response response = await http.get(urlParsed);

    if (response.statusCode == 200) {
      String data = response.body;
      Map<String, dynamic> dataJsonDecode = jsonDecode(data);

      var pokemon = Pokemon.fromJson(dataJsonDecode);
      pokemonList.add(
        {
          'id': pokemon.number,
          'image': pokemon.image,
        },
      );
      print(pokemonList);
      _dataPokemonController.add(pokemon);
    } else {
      _dataPokemonController.addError(response.statusCode);
      throw (response.statusCode);
    }
  }

  @override
  dispose() {
    _dataPokemonController.close();
  }
}
