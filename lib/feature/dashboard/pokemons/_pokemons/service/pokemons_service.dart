import 'package:injectable/injectable.dart';

import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemons_query_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemons_response_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/service/i_pokemons_service.dart';

@Injectable(as: IPokemonsService)
class PokemonsService extends IPokemonsService {
  PokemonsService(super.networkManager);

  String get _getAllPokemonsRoute => 'pokemon';

  @override
  Future<PokemonsResponseModel?> getAllPokemons(
    PokemonsQueryModel model,
  ) async {
    final response = await manager.send<PokemonsResponseModel>(
      _getAllPokemonsRoute,
      parseModel: PokemonsResponseModel(),
      queryParameters: model.toJson(),
    );
    return response;
  }
}
