// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_color.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodColorAdapter extends TypeAdapter<FoodColor> {
  @override
  final int typeId = 0;

  @override
  FoodColor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FoodColor.red;
      case 1:
        return FoodColor.orange;
      case 2:
        return FoodColor.yellow;
      case 3:
        return FoodColor.green;
      case 4:
        return FoodColor.blue;
      case 5:
        return FoodColor.purple;
      case 6:
        return FoodColor.white;
      case 7:
        return FoodColor.brown;
      default:
        return FoodColor.red;
    }
  }

  @override
  void write(BinaryWriter writer, FoodColor obj) {
    switch (obj) {
      case FoodColor.red:
        writer.writeByte(0);
        break;
      case FoodColor.orange:
        writer.writeByte(1);
        break;
      case FoodColor.yellow:
        writer.writeByte(2);
        break;
      case FoodColor.green:
        writer.writeByte(3);
        break;
      case FoodColor.blue:
        writer.writeByte(4);
        break;
      case FoodColor.purple:
        writer.writeByte(5);
        break;
      case FoodColor.white:
        writer.writeByte(6);
        break;
      case FoodColor.brown:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
