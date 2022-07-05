class PokemonDetail {
  String? name;
  int? weight;
  int? height;

  PokemonDetail({this.name, this.weight, this.height});

  PokemonDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    weight = json['weight'];
    height = json['height'];
  }
}
