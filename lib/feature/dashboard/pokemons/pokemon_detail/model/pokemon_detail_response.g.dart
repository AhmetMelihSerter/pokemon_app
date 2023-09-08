// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailResponse _$PokemonDetailResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      weight: json['weight'] as int?,
      height: json['height'] as int?,
      abilities: (json['abilities'] as List<dynamic>?)
              ?.map((e) => PokemonDetailAbilitiesModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
      stats: (json['stats'] as List<dynamic>?)
              ?.map((e) =>
                  PokemonDetailStatsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PokemonDetailResponseToJson(
        PokemonDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'abilities': instance.abilities,
      'stats': instance.stats,
    };
