import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/core/base/model/base_model_response.dart';
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/model/pokemon_list_model.dart';

part 'pokemons_response_model.g.dart';

@JsonSerializable()
class PokemonsResponseModel extends BaseModelResponse<PokemonsResponseModel> {
  PokemonsResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results = const [],
  });

  factory PokemonsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonsResponseModelFromJson(json);
  }

  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonListModel> results;

  @override
  PokemonsResponseModel fromJson(Map<String, dynamic> json) {
    return _$PokemonsResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PokemonsResponseModelToJson(this);
  }
}
