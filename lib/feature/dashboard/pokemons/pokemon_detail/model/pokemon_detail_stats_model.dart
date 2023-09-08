import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/core/base/model/base_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/model/pokemon_stat_model.dart';

part 'pokemon_detail_stats_model.g.dart';

@JsonSerializable()
class PokemonDetailStatsModel extends BaseModel<PokemonDetailStatsModel>
    with EquatableMixin {
  PokemonDetailStatsModel({
    this.stat,
    this.baseStat,
    this.effort,
  });

  factory PokemonDetailStatsModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonDetailStatsModelFromJson(json);
  }

  final PokemonStatModel? stat;
  @JsonKey(name: 'base_stat')
  final int? baseStat;
  final int? effort;

  @override
  PokemonDetailStatsModel fromJson(Map<String, dynamic> json) {
    return PokemonDetailStatsModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PokemonDetailStatsModelToJson(this);
  }

  PokemonDetailStatsModel copyWith({
    PokemonStatModel? stat,
    int? baseStat,
    int? effort,
  }) {
    return PokemonDetailStatsModel(
      stat: stat ?? this.stat,
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
    );
  }

  @override
  List<Object?> get props => [stat, baseStat, effort];
}
