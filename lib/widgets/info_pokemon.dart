import 'package:flutter/material.dart';

class InfoPokemon extends StatelessWidget {
  InfoPokemon(this.pokemonData);
  final pokemonData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        // color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      height: 300.0,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            '${pokemonData.namePokemon.toUpperCase()} #${pokemonData.numberPokemon}',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
          ),
          Text(
            'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
            style: TextStyle(
              // color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40.0,
                width: 90.0,
                child: Center(
                  child: Text(
                    'Normal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Colors.yellow,
              ),
              SizedBox(
                width: 30.0,
              ),
              Container(
                height: 40.0,
                width: 90.0,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Nono',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
