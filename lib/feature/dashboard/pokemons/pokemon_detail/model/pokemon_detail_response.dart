import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:pokemon/core/base/model/base_storage_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/model/pokemon_detail_abilities_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/model/pokemon_detail_stats_model.dart';

part 'pokemon_detail_response.g.dart';

@JsonSerializable()
class PokemonDetailResponse extends BaseStorageModel<PokemonDetailResponse>
    with EquatableMixin {
  PokemonDetailResponse({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.abilities = const [],
    this.stats = const [],
  });

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) {
    return _$PokemonDetailResponseFromJson(json);
  }

  final int? id;
  final String? name;
  final int? weight;
  final int? height;
  final List<PokemonDetailAbilitiesModel> abilities;
  final List<PokemonDetailStatsModel> stats;

  @override
  PokemonDetailResponse fromJson(Map<String, dynamic> json) {
    return PokemonDetailResponse.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PokemonDetailResponseToJson(this);
  }
  
  @override
  List<Object?> get props => [id, name, weight, height];
}
