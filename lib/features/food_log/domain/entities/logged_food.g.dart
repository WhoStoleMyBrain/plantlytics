// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_food.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoggedFoodAdapter extends TypeAdapter<LoggedFood> {
  @override
  final int typeId = 3;

  @override
  LoggedFood read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoggedFood(
      fields[0] as Food,
      fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LoggedFood obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.food)
      ..writeByte(1)
      ..write(obj.loggedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedFoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
