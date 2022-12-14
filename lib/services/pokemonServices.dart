import 'package:http/http.dart' as http;
import 'dart:convert';

class PokemonServices {
  PokemonServices({this.url});

  String url;

  Future getData() async {
    var urlParsed = Uri.parse(url);
    http.Response response = await http.get(urlParsed);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
