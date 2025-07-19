import 'package:hive/hive.dart';

part 'food_color.g.dart';

@HiveType(typeId: 0)
enum FoodColor {
  @HiveField(0)
  red,
  @HiveField(1)
  orange,
  @HiveField(2)
  yellow,
  @HiveField(3)
  green,
  @HiveField(4)
  blue,
  @HiveField(5)
  purple,
  @HiveField(6)
  white,
  @HiveField(7)
  brown,
}
