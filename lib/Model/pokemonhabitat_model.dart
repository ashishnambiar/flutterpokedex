// To parse this JSON data, do
//
//     final pokemonHabitatModel = pokemonHabitatModelFromJson(jsonString);

import 'dart:convert';

PokemonHabitatModel pokemonHabitatModelFromJson(String str) =>
    PokemonHabitatModel.fromJson(json.decode(str));

String pokemonHabitatModelToJson(PokemonHabitatModel data) =>
    json.encode(data.toJson());

class PokemonHabitatModel {
  PokemonHabitatModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory PokemonHabitatModel.fromJson(Map<String, dynamic> json) =>
      PokemonHabitatModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
