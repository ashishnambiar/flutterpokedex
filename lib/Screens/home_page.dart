import 'package:flutter/material.dart';
import 'package:flutterpokedex/Bloc/get_pokemon_data.dart';
import 'package:flutterpokedex/Model/pokemondata_model.dart';
import 'package:flutterpokedex/Screens/changetheme_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _listcontroller = ScrollController();
    var poke = PokemonDataStream();
    var next;
    List<Result?> pokelist = [];
    bool _isLoading = false;
    poke.getPokemonData();
    return Scaffold(
      appBar: AppBar(
        title: Text("PokeDex"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeThemePage(),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: StreamBuilder<PokemonDataModel>(
        stream: poke.stream,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            next = snapshot.data!.next;
            if (!pokelist.contains(
              snapshot.data!.results![snapshot.data!.results!.length - 1],
            )) {
              snapshot.data!.results!.toList().forEach((element) {
                pokelist.add(element);
                _isLoading = false;
              });
            }
            return CustomScrollView(
              controller: _listcontroller,
              slivers: [
                SliverAppBar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    floating: true,
                    title: Center(
                      child: Text("Pokemon List",
                          style: Theme.of(context).textTheme.headline4),
                    )),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      _listcontroller.addListener(
                        () {
                          if (_listcontroller.position.extentAfter == 0 &&
                              _isLoading == false) {
                            _isLoading = true;
                            print("end");
                            poke.getPokemonData(url: next);
                          }
                        },
                      );
                      return TextButton(
                          onPressed: () {
                            print("pressed");
                            // poke.getPokemonData(url: snapshot.data!.next);
                          },
                          child: Text(
                            "${pokelist[index]!.name}",
                            style: TextStyle(fontSize: 30),
                          ));
                    },
                    childCount: pokelist.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
