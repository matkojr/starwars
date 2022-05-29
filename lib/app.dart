
import 'package:flutter/material.dart';
import 'package:starwars/router.dart';
import 'package:starwars/screens/details_screen.dart';
import 'package:starwars/screens/home_screen.dart';
import 'package:starwars/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      initialRoute: Routes.homeScreen,
      routes: {
        Routes.homeScreen: (context) => const HomeScreen(),
        Routes.detailsScreen: (context) => const DetailsScreen(),
      },
    );
  }
}