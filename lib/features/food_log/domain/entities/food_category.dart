import 'package:hive/hive.dart';

part 'food_category.g.dart';

@HiveType(typeId: 1)
enum FoodCategory {
  @HiveField(0)
  leafyGreen,
  @HiveField(1)
  cruciferous,
  @HiveField(2)
  root,
  @HiveField(3)
  bulb,
  @HiveField(4)
  fruit,
  @HiveField(5)
  legume,
  @HiveField(6)
  mushroom,
  @HiveField(7)
  berry,
}
