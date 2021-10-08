import 'dart:convert';

PokemonDataModel pokemonDataModelFromJson(String str) =>
    PokemonDataModel.fromJson(json.decode(str));

String pokemonDataModelToJson(PokemonDataModel data) =>
    json.encode(data.toJson());

class PokemonDataModel {
  PokemonDataModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<Result?>? results;

  factory PokemonDataModel.fromJson(Map<String, dynamic> json) =>
      PokemonDataModel(
        count: json["count"] == null ? null : json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x!.toJson())),
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
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}
