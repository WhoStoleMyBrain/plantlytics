// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodCategoryAdapter extends TypeAdapter<FoodCategory> {
  @override
  final int typeId = 1;

  @override
  FoodCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FoodCategory.leafyGreen;
      case 1:
        return FoodCategory.cruciferous;
      case 2:
        return FoodCategory.root;
      case 3:
        return FoodCategory.bulb;
      case 4:
        return FoodCategory.fruit;
      case 5:
        return FoodCategory.legume;
      case 6:
        return FoodCategory.mushroom;
      case 7:
        return FoodCategory.berry;
      default:
        return FoodCategory.leafyGreen;
    }
  }

  @override
  void write(BinaryWriter writer, FoodCategory obj) {
    switch (obj) {
      case FoodCategory.leafyGreen:
        writer.writeByte(0);
        break;
      case FoodCategory.cruciferous:
        writer.writeByte(1);
        break;
      case FoodCategory.root:
        writer.writeByte(2);
        break;
      case FoodCategory.bulb:
        writer.writeByte(3);
        break;
      case FoodCategory.fruit:
        writer.writeByte(4);
        break;
      case FoodCategory.legume:
        writer.writeByte(5);
        break;
      case FoodCategory.mushroom:
        writer.writeByte(6);
        break;
      case FoodCategory.berry:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
