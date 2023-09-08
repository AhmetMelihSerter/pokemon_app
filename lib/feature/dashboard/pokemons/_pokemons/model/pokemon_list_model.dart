import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:pokemon/core/base/model/base_storage_model.dart';
import 'package:pokemon/product/constants/extensions/string_extensions.dart';
import 'package:pokemon/product/constants/product/product_constants.dart';

part 'pokemon_list_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class PokemonListModel extends BaseStorageModel<PokemonListModel>
    with EquatableMixin {
  PokemonListModel({
    this.name,
    this.url,
  });

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    return _$PokemonListModelFromJson(json);
  }

  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? url;

  String get pokemonId => url?.lastChars(2).replaceAll('/', '') ?? '';

  String get imageUrl => '${ProductConstants.POKEMON_IMAGE_URL}$pokemonId.png';

  @override
  PokemonListModel fromJson(Map<String, dynamic> json) {
    return _$PokemonListModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PokemonListModelToJson(this);
  }

  @override
  List<Object?> get props => [name, url];

  PokemonListModel copyWith({
    String? name,
    String? url,
  }) {
    return PokemonListModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
