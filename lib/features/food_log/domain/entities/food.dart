import 'package:hive/hive.dart';
import 'food_color.dart';
import 'food_category.dart';

part 'food.g.dart';

@HiveType(typeId: 2)
class Food {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final FoodColor color;

  @HiveField(2)
  final FoodCategory category;

  const Food(this.name, this.color, this.category);
}
