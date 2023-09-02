// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchRepoModelAdapter extends TypeAdapter<SearchRepoModel> {
  @override
  final int typeId = 0;

  @override
  SearchRepoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchRepoModel(
      id: fields[0] as int,
      name: fields[1] as String,
      isSelected: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SearchRepoModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchRepoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
