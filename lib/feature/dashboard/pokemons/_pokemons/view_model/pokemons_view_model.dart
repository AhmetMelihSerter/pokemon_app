import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:pokemon/core/base/view_model/base_view_model.dart';
import 'package:pokemon/feature/dashboard/favorites/service/i_favorites_service.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemon_list_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemons_query_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/service/i_pokemons_service.dart';
import 'package:pokemon/product/constants/locale/local_keys.g.dart';
import 'package:pokemon/product/init/navigation/navigation_router.dart';

class PokemonsViewModel extends BaseViewModel {
  PokemonsViewModel(this._service, this._favoriteService);

  final IPokemonsService _service;

  final IFavoritesService _favoriteService;

  late PokemonsQueryModel _pokemonQueryModel;

  List<PokemonListModel> _pokemonList = [];

  List<PokemonListModel> get pokemonList => _pokemonList;

  int _favoritePokemonCount = 0;

  int get favoritePokemonCount => _favoritePokemonCount;

  bool onScrollEndNotification(ScrollEndNotification notification) {
    if (notification.metrics.atEdge && notification.metrics.pixels != 0) {
      final lastPage = _pokemonQueryModel.offset + 10;
      _pokemonQueryModel = _pokemonQueryModel.copyWith(
        offset: lastPage,
      );
      _getAllPokemons(isEndScroll: true);
    }
    return true;
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _pokemonQueryModel = PokemonsQueryModel();
    Future.microtask(() async {
      await _futureInitialize();
    });
  }

  Future<void> _futureInitialize() async {
    try {
      await _getFavoritePokemon();
      await _getAllPokemons();
    } catch (e) {
      logger.error('Error: $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> _getFavoritePokemon() async {
    final favorites = await _favoriteService.getAllFavorites();
    _favoritePokemonCount = favorites.length;
    notifyListeners();
  }

  Future<void> _getAllPokemons({bool isEndScroll = false}) async {
    final responseModel = await _service.getAllPokemons(_pokemonQueryModel);

    if (responseModel == null) {
      return;
    }

    if (isEndScroll) {
      final tempList = List<PokemonListModel>.from(_pokemonList)
        ..addAll(responseModel.results);
      _pokemonList = tempList.toSet().toList();
      return;
    }
    _pokemonList = responseModel.results;
  }

  Future<void> onPokemonDetail(PokemonListModel model) async {
    if (model.url.ext.isNullOrEmpty) {
      showFlushBar(
        message: LocaleKeys
            .dashboard_pokemons_pokemons_view_exceptions_url_not_found
            .tr(),
      );
      return;
    }
    await navigationService.navigateToPage(
      route: PokemonDetailRoute(
        pokemonModel: model,
      ),
    );
    await _getFavoritePokemon();
  }
}
