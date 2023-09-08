// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonsQueryModel _$PokemonsQueryModelFromJson(Map<String, dynamic> json) =>
    PokemonsQueryModel(
      limit: json['limit'] as int? ?? 10,
      offset: json['offset'] as int? ?? 0,
    );

Map<String, dynamic> _$PokemonsQueryModelToJson(PokemonsQueryModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };
