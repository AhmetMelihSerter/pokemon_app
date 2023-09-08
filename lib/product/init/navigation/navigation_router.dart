import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/feature/dashboard/_dashboard/dashboard_view.dart';

import 'package:pokemon/feature/dashboard/favorites/view/favorites_view.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemon_list_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/view/pokemons_view.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/view/pokemon_detail_view.dart';
import 'package:pokemon/feature/splash/view/splash_view.dart';

part 'navigation_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class NavigationRouter extends _$NavigationRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: DashboardRoute.page,
          children: [
            AutoRoute(page: PokemonsRoute.page, initial: true, maintainState: false),
            AutoRoute(page: FavoritesRoute.page, maintainState: false),
          ],
        ),
        AutoRoute(page: PokemonDetailRoute.page),
      ];
}
