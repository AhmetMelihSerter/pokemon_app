// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'navigation_router.dart';

abstract class _$NavigationRouter extends RootStackRouter {
  // ignore: unused_element
  _$NavigationRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesView(),
      );
    },
    PokemonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PokemonDetailView(
          key: args.key,
          pokemonModel: args.pokemonModel,
        ),
      );
    },
    PokemonsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PokemonsView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoritesView]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PokemonDetailView]
class PokemonDetailRoute extends PageRouteInfo<PokemonDetailRouteArgs> {
  PokemonDetailRoute({
    Key? key,
    required PokemonListModel pokemonModel,
    List<PageRouteInfo>? children,
  }) : super(
          PokemonDetailRoute.name,
          args: PokemonDetailRouteArgs(
            key: key,
            pokemonModel: pokemonModel,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailRoute';

  static const PageInfo<PokemonDetailRouteArgs> page =
      PageInfo<PokemonDetailRouteArgs>(name);
}

class PokemonDetailRouteArgs {
  const PokemonDetailRouteArgs({
    this.key,
    required this.pokemonModel,
  });

  final Key? key;

  final PokemonListModel pokemonModel;

  @override
  String toString() {
    return 'PokemonDetailRouteArgs{key: $key, pokemonModel: $pokemonModel}';
  }
}

/// generated route for
/// [PokemonsView]
class PokemonsRoute extends PageRouteInfo<void> {
  const PokemonsRoute({List<PageRouteInfo>? children})
      : super(
          PokemonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
