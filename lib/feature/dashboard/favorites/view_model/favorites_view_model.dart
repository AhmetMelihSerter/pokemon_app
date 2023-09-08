import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:pokemon/core/base/view_model/base_view_model.dart';
import 'package:pokemon/feature/dashboard/favorites/service/i_favorites_service.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemon_list_model.dart';
import 'package:pokemon/product/constants/locale/local_keys.g.dart';
import 'package:pokemon/product/init/navigation/navigation_router.dart';

class FavoritesViewModel extends BaseViewModel {
  FavoritesViewModel(this._service);

  final IFavoritesService _service;

  List<PokemonListModel> _favoritesList = [];

  List<PokemonListModel> get favoritesList => _favoritesList;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    Future.microtask(() async {
      await _futureInitialize();
    });
  }

  Future<void> _futureInitialize() async {
    final tempList = await _service.getAllFavorites();
    _favoritesList = tempList.reversed.toList();
    notifyListeners();
  }

  Future<void> onPokemonDetail(PokemonListModel model) async {
    if (model.url.ext.isNullOrEmpty) {
      showFlushBar(
        message: LocaleKeys.dashboard_favorites_view_app_bar_title.tr(),
      );
      return;
    }
    await navigationService.navigateToPage(
      route: PokemonDetailRoute(
        pokemonModel: model,
      ),
    );
    await _futureInitialize();
  }

  Future<bool> deleteFavorites(PokemonListModel model) async {
    var isConfirm = false;
    try {
      await _service.deleteFavorites(model);
      isConfirm = _favoritesList.remove(model);
    } catch (e) {
      logger.error('Error: $e');
    }
    return isConfirm;
  }
}
