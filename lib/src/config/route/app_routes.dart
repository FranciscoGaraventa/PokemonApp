import 'package:flutter/material.dart';
import 'package:pokemon_app/src/presentation/views/favorites_view.dart';
import 'package:pokemon_app/src/presentation/views/pokemon_detail_view.dart';

import '../../presentation/views/home_view.dart';
import 'named_route.dart';

class AppRouter {
  AppRouter();

  Map<String, WidgetBuilder> get routes => {
        NamedRoute.homeView: (BuildContext context) => const HomeView(),
      };

  RouteFactory get generatedRoutes => (RouteSettings settings) {
        MaterialPageRoute? route;
        switch (settings.name) {
          case NamedRoute.pokemonDetailView:
            final arguments = settings.arguments as Map<String, dynamic>;
            route = MaterialPageRoute(
              settings: settings,
              builder: (context) => PokemonDetailView(
                pokemon: arguments['pokemon'],
              ),
            );
            break;
          case NamedRoute.favoritesView:
            route = MaterialPageRoute(
              settings: settings,
              builder: (context) => const FavoritesView(),
            );
            break;
        }
        return route;
      };
}
