import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/pokemon_detail.dart';
import 'package:pokemon/pokemon_index.dart';

class PokemonAPI {
  Future<PokemonIndex> fetchPokemon() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return PokemonIndex.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Pokemon');
    }
  }

  Future <PokemonDetail> fetchPokemonDetail(url)async{
    final response =
        await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return PokemonDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Pokemon');
    }

  }
}
