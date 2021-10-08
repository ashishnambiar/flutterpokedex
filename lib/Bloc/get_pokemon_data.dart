import 'dart:async';
import 'dart:convert';
import 'package:flutterpokedex/Model/pokemondata_model.dart';
import 'package:http/http.dart' as http;

class PokemonDataStream {
  StreamController<PokemonDataModel> _controller =
      StreamController<PokemonDataModel>();
  Stream<PokemonDataModel> get stream => _controller.stream;
  StreamSink<PokemonDataModel> get _sink => _controller.sink;

  // Stream<PokemonDataModel>
  getPokemonData({String url = "https://pokeapi.co/api/v2/pokemon"}) async
  //  *
  {
    print("called");
    var response = await http.get(Uri.parse(url));
    print(response.body);
    Map<String, dynamic> json = jsonDecode(response.body);
    var data = PokemonDataModel.fromJson(json);
    _sink.add(data);
    // yield data;
  }

  dispose() {
    _controller.close();
  }
}
