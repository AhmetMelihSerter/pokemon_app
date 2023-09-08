import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:pokemon/core/base/model/base_model.dart';

part 'pokemon_stat_model.g.dart';

@JsonSerializable()
class PokemonStatModel extends BaseModel<PokemonStatModel> with EquatableMixin {
  PokemonStatModel({
    this.name,
    this.url,
  });

  factory PokemonStatModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonStatModelFromJson(json);
  }

  final String? name;
  final String? url;

  @override
  PokemonStatModel fromJson(Map<String, dynamic> json) {
    return PokemonStatModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PokemonStatModelToJson(this);
  }

  PokemonStatModel copyWith({
    String? name,
    String? url,
  }) {
    return PokemonStatModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, url];
}
