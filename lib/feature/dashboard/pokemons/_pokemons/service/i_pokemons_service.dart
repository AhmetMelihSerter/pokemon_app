import 'package:pokemon/core/base/service/base_service.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemons_query_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemons_response_model.dart';

abstract class IPokemonsService extends BaseService {
  IPokemonsService(super.networkManager);

  Future<PokemonsResponseModel?> getAllPokemons(PokemonsQueryModel model);
}
