// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonsResponseModel _$PokemonsResponseModelFromJson(
        Map<String, dynamic> json) =>
    PokemonsResponseModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => PokemonListModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PokemonsResponseModelToJson(
        PokemonsResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
