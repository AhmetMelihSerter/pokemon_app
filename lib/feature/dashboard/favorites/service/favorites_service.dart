import 'package:injectable/injectable.dart';

import 'package:pokemon/feature/dashboard/favorites/service/i_favorites_service.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemon_list_model.dart';

@Injectable(as: IFavoritesService)
class FavoritesService extends IFavoritesService {
  FavoritesService(super.manager, super.storage);

  @override
  Future<List<PokemonListModel>> getAllFavorites() async {
    final data = storage.readAll<PokemonListModel>(
      parseModel: PokemonListModel(),
    );
    return data;
  }

  @override
  Future<void> addFavorites(PokemonListModel model) async {
    await storage.write<PokemonListModel>(
      parseModel: model,
    );
  }

  @override
  Future<void> deleteFavorites(PokemonListModel model) async {
    await storage.delete<PokemonListModel>(
      parseModel: model,
    );
  }
}
