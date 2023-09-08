import 'package:json_annotation/json_annotation.dart';

import 'package:pokemon/core/base/model/base_model.dart';

part 'pokemons_query_model.g.dart';

@JsonSerializable()
class PokemonsQueryModel extends BaseModel<PokemonsQueryModel> {
  PokemonsQueryModel({
    this.limit = 10,
    this.offset = 0,
  });

  factory PokemonsQueryModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonsQueryModelFromJson(json);
  }

  final int limit;
  final int offset;

  @override
  PokemonsQueryModel fromJson(Map<String, dynamic> json) {
    return _$PokemonsQueryModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PokemonsQueryModelToJson(this);
  }

  PokemonsQueryModel copyWith({
    int? limit,
    int? offset,
  }) {
    return PokemonsQueryModel(
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }
}
