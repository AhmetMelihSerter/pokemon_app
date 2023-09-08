import 'package:injectable/injectable.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/model/pokemon_detail_response.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/service/i_pokemon_detail_service.dart';

@Injectable(as: IPokemonDetailService)
class PokemonDetailService extends IPokemonDetailService {
  PokemonDetailService(super.manager);

  @override
  Future<PokemonDetailResponse?> getPokemonByUrl(String url) async {
    final route = splitUrl(url);
    final response = await manager.send<PokemonDetailResponse>(
      route,
      parseModel: PokemonDetailResponse(),
    );
    return response;
  }
}
