import 'package:flutter/material.dart';
import 'package:flutterpokedex/Bloc/change_theme.dart';
import 'package:flutterpokedex/Bloc/pokemon_habitat.dart';
import 'package:provider/provider.dart';

class ChangeThemePage extends StatelessWidget {
  const ChangeThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var response = Provider.of<DataProvider>(context, listen: false);
    var themedata = Provider.of<ChangeTheme>(context, listen: false);
    response.getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("PokeDex Theme Change"),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<DataProvider>(
              builder: (context, pokedata, child) {
                if (pokedata.recieveData.results == null) {
                  return CircularProgressIndicator();
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: pokedata.recieveData.count,
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {
                          themedata.getTheme(
                              "${pokedata.recieveData.results![index].name}");
                        },
                        child: Text(
                          "${pokedata.recieveData.results![index].name}",
                          style: TextStyle(fontSize: 50),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
