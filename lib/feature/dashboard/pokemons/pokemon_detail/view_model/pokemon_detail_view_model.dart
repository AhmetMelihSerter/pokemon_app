import 'package:flutter/material.dart';

import 'package:pokemon/core/base/view_model/base_view_model.dart';
import 'package:pokemon/feature/dashboard/favorites/service/i_favorites_service.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemon_list_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/model/pokemon_detail_response.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/service/i_pokemon_detail_service.dart';

class PokemonDetailViewModel extends BaseViewModel {
  PokemonDetailViewModel(
    this._service,
    this._favoritesService,
  );

  final IPokemonDetailService _service;

  final IFavoritesService _favoritesService;

  late final PokemonListModel _pokemonModel;

  bool isFavorite = false;

  PokemonDetailResponse? _response;

  PokemonDetailResponse? get response => _response;

  String get imageUrl => _pokemonModel.imageUrl;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void setArgs(PokemonListModel value) {
    _pokemonModel = value;
  }

  @override
  void init() {
    Future.microtask(() async {
      await _futureInitialize();
    });
  }

  Future<void> _futureInitialize() async {
    try {
      await _checkFavorites();
      await _getPokemonByUrl();
    } catch (e) {
      logger.error('Error: $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> _getPokemonByUrl() async {
    _response = await _service.getPokemonByUrl(_pokemonModel.url!);
  }

  Future<void> _checkFavorites() async {
    final favoritesList = await _favoritesService.getAllFavorites();

    isFavorite = favoritesList.contains(_pokemonModel);
  }

  void onTapFavorites() {
    if (isFavorite) {
      _deleteFavorites();
    } else {
      _addFavorites();
    }
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> _addFavorites() async {
    await _favoritesService.addFavorites(_pokemonModel);
  }

  Future<void> _deleteFavorites() async {
    await _favoritesService.deleteFavorites(_pokemonModel);
  }
}
