import 'package:pokemon/core/base/service/base_service.dart';
import 'package:pokemon/core/init/storage/i_storage_manager.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemon_list_model.dart';

abstract class IFavoritesService extends BaseService {
  IFavoritesService(super.manager, this.storage);

  final IStorageManager storage;

  Future<List<PokemonListModel>> getAllFavorites();
  Future<void> addFavorites(PokemonListModel model);
  Future<void> deleteFavorites(PokemonListModel model);
}
