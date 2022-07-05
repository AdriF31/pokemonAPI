import 'package:flutter/material.dart';
import 'package:pokemon/pokemon_index.dart';
import 'package:pokemon/screen/detail.dart';
import 'package:pokemon/api/pokeapi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<PokemonIndex> pokemon;
  PokemonAPI poke = PokemonAPI();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pokemon = poke.fetchPokemon();
  }

  checkPokemon(context, url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PokemonDetailScreen(url: url)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<PokemonIndex>(
        future: pokemon,
        builder: ((context, snapshot) {
          var data = snapshot.data!.pokemonSummary;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
              if (snapshot.hasData) {
                return Container(
                    height: 50,
                    child: ListTile(
                      title: Text(data[index].name!),
                      onTap: () {
                        checkPokemon(context, data[index].url!);
                      },
                    ));
              } else if (snapshot.hasError) {
                return Text(' ${snapshot.error}');
              }
              return CircularProgressIndicator();
            }),
          );
        }),
      ),
    );
  }
}
