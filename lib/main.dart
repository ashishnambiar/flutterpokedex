import 'package:flutter/material.dart';
import 'package:flutterpokedex/Bloc/change_theme.dart';
import 'package:flutterpokedex/Bloc/pokemon_habitat.dart';
import 'package:flutterpokedex/Screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(
          create: (context) => DataProvider(),
        ),
        ChangeNotifierProvider<ChangeTheme>(
          create: (context) => ChangeTheme(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeTheme>(builder: (context, data, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: data.newTheme,
        home: HomePage(),
      );
    });
  }
}
