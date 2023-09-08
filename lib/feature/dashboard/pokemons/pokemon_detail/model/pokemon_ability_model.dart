import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:pokemon/core/base/model/base_model.dart';

part 'pokemon_ability_model.g.dart';

@JsonSerializable()
class PokemonAbilityModel extends BaseModel<PokemonAbilityModel>
    with EquatableMixin {
  PokemonAbilityModel({
    this.name,
    this.url,
  });

  factory PokemonAbilityModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonAbilityModelFromJson(json);
  }

  final String? name;
  final String? url;

  @override
  PokemonAbilityModel fromJson(Map<String, dynamic> json) {
    return PokemonAbilityModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PokemonAbilityModelToJson(this);
  }

  PokemonAbilityModel copyWith({
    String? name,
    String? url,
  }) {
    return PokemonAbilityModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, url];
}
