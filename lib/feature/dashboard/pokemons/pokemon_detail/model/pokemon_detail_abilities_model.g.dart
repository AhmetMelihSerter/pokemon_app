// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_abilities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailAbilitiesModel _$PokemonDetailAbilitiesModelFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailAbilitiesModel(
      ability: json['ability'] == null
          ? null
          : PokemonAbilityModel.fromJson(
              json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool?,
      slot: json['slot'] as int?,
    );

Map<String, dynamic> _$PokemonDetailAbilitiesModelToJson(
        PokemonDetailAbilitiesModel instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };
