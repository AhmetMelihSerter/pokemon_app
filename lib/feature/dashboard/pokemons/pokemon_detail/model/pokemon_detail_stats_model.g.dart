// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailStatsModel _$PokemonDetailStatsModelFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailStatsModel(
      stat: json['stat'] == null
          ? null
          : PokemonStatModel.fromJson(json['stat'] as Map<String, dynamic>),
      baseStat: json['base_stat'] as int?,
      effort: json['effort'] as int?,
    );

Map<String, dynamic> _$PokemonDetailStatsModelToJson(
        PokemonDetailStatsModel instance) =>
    <String, dynamic>{
      'stat': instance.stat,
      'base_stat': instance.baseStat,
      'effort': instance.effort,
    };
