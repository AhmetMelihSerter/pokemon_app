// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonListModelAdapter extends TypeAdapter<PokemonListModel> {
  @override
  final int typeId = 2;

  @override
  PokemonListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonListModel(
      name: fields[0] as String?,
      url: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonListModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListModel _$PokemonListModelFromJson(Map<String, dynamic> json) =>
    PokemonListModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PokemonListModelToJson(PokemonListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
