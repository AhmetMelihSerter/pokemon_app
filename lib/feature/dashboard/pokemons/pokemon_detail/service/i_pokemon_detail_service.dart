import 'package:pokemon/core/base/service/base_service.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/model/pokemon_detail_response.dart';

abstract class IPokemonDetailService extends BaseService {
  IPokemonDetailService(super.manager);

  Future<PokemonDetailResponse?> getPokemonByUrl(String url);
}
