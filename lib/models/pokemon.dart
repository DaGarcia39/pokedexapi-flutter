class Pokemon {
  final String name;
  final int number;
  final String image;
  final List abilities;
  final String type;
  final int weight;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  Pokemon({
    this.name,
    this.number,
    this.image,
    this.abilities,
    this.type,
    this.weight,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      number: json['id'],
      image: json['sprites']['other']['official-artwork']['front_default'],
      abilities: json['abilities'],
      type: json['types'][0]['type']['name'],
      weight: json['weight'],
      hp: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      defense: json['stats'][2]['base_stat'],
      specialAttack: json['stats'][3]['base_stat'],
      specialDefense: json['stats'][4]['base_stat'],
      speed: json['stats'][5]['base_stat'],
    );
  }
}
