import 'package:animate_do/animate_do.dart';
import 'package:bloc_pokemon_api/assets/constants/constants.dart';
import 'package:bloc_pokemon_api/models/pokemon.dart';
import 'package:bloc_pokemon_api/widgets/list_save_pokemon.dart';
import 'package:bloc_pokemon_api/widgets/progress_bar_stats.dart';
import 'package:flutter/material.dart';

class ShowPokemonInformation extends StatefulWidget {
  ShowPokemonInformation(this.pokemonData, this.pokemonBloc);

  final Pokemon pokemonData;
  final pokemonBloc;

  @override
  _ShowPokemonInformationState createState() => _ShowPokemonInformationState();
}

class _ShowPokemonInformationState extends State<ShowPokemonInformation> {
  final _fieldTextController = TextEditingController();
  String namePokemon;

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) async {
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
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // widget.pokemonBloc.pokemonList.
                  return ListSavePokemon(
                    pokemonBloc: widget.pokemonBloc,
                    pokemonData: widget.pokemonData,
                    idPokemon: '${widget.pokemonBloc.pokemonList[index]['id']}',
                    image: widget.pokemonBloc.pokemonList[index]['image'],
                  );
                },
                itemCount: widget.pokemonBloc.pokemonList.length,
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView(
              controller: controller,
              children: [
                Card(
                  elevation: 7.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          '${widget.pokemonData.name.toUpperCase()} #${widget.pokemonData.number}',
                          style: TextStyle(
                            fontSize: 40.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                        FadeInImage(
                          placeholder:
                              AssetImage('lib/assets/img/pokeball.gif'),
                          image: NetworkImage(
                            widget.pokemonData.image,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              BounceInDown(
                                child: Icon(
                                  Icons.expand_more,
                                  size: 50.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.lightBlueAccent,
                                  ),
                                  width: double.infinity,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Stats'.toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          ProgressBarStats(
                                            nameStatistics: ' Hp',
                                            colorStatistics: Color(0xFF2ECC71),
                                            valueStatistics:
                                                widget.pokemonData.hp,
                                          ),
                                          ProgressBarStats(
                                            nameStatistics: ' Attack',
                                            colorStatistics: Color(0xFFE74C3C),
                                            valueStatistics:
                                                widget.pokemonData.attack,
                                          ),
                                          ProgressBarStats(
                                            nameStatistics: ' Defense',
                                            colorStatistics: Color(0xFF5DADE2),
                                            valueStatistics:
                                                widget.pokemonData.defense,
                                          ),
                                          ProgressBarStats(
                                            nameStatistics: ' Special attack',
                                            colorStatistics: Color(0xFFF4D03F),
                                            valueStatistics: widget
                                                .pokemonData.specialAttack,
                                          ),
                                          ProgressBarStats(
                                            nameStatistics: ' special-defense',
                                            colorStatistics: Color(0xFF48C9B0),
                                            valueStatistics: widget
                                                .pokemonData.specialDefense,
                                          ),
                                          ProgressBarStats(
                                            nameStatistics: ' Speed',
                                            colorStatistics: Color(0xFFF5B041),
                                            valueStatistics:
                                                widget.pokemonData.speed,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ListSavePokemon(
//             pokemonBloc: widget.pokemonBloc,
//             pokemonData: widget.pokemonData,
//             idPokemon: 35,
//           ),


// Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView(
//                 controller: controller,
//                 physics: BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 children: [],
//               ),
//             ),
//           ),
