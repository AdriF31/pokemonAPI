import 'package:flutter/material.dart';
import 'package:pokemon/api/pokeapi.dart';
import 'package:pokemon/pokemon_detail.dart';

class PokemonDetailScreen extends StatefulWidget {
  PokemonDetailScreen({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  late Future<PokemonDetail> pokemon;
  @override
  void initState() {

    super.initState();
    pokemon = PokemonAPI().fetchPokemonDetail(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<PokemonDetail>(
        future: pokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return Column(children: [Text(data.name!)]);
          }
          return const Center(child:  CircularProgressIndicator());
        },
      ),
    );
  }
}
