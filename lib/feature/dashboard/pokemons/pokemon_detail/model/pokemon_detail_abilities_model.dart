import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/core/base/model/base_model.dart';
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/model/pokemon_ability_model.dart';
import 'package:pokemon/product/constants/locale/local_keys.g.dart';

part 'pokemon_detail_abilities_model.g.dart';

@JsonSerializable()
class PokemonDetailAbilitiesModel extends BaseModel<PokemonDetailAbilitiesModel>
    with EquatableMixin {
  PokemonDetailAbilitiesModel({
    this.ability,
    this.isHidden,
    this.slot,
  });
  factory PokemonDetailAbilitiesModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonDetailAbilitiesModelFromJson(json);
  }

  final PokemonAbilityModel? ability;
  @JsonKey(name: 'is_hidden')
  final bool? isHidden;
  final int? slot;

  String get hiddenText => (isHidden ?? false)
      ? LocaleKeys
          .dashboard_pokemons_pokemon_detail_view_stats_stats_subtitle_hidden_yes
      : LocaleKeys
          .dashboard_pokemons_pokemon_detail_view_stats_stats_subtitle_hidden_no;

  @override
  PokemonDetailAbilitiesModel fromJson(Map<String, dynamic> json) {
    return PokemonDetailAbilitiesModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PokemonDetailAbilitiesModelToJson(this);
  }

  PokemonDetailAbilitiesModel copyWith({
    PokemonAbilityModel? ability,
    bool? isHidden,
    int? slot,
  }) {
    return PokemonDetailAbilitiesModel(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }

  @override
  List<Object?> get props => [isHidden, slot];
}
