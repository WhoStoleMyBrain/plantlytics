import 'package:plantlytics/features/food_log/domain/entities/food.dart';
import 'package:plantlytics/features/food_log/domain/entities/food_category.dart';
import 'package:plantlytics/features/food_log/domain/entities/food_color.dart';

const List<Food> kFoodOptions = [
  Food('Apple', FoodColor.red, FoodCategory.fruit),
  Food('Banana', FoodColor.yellow, FoodCategory.fruit),
  Food('Blueberry', FoodColor.blue, FoodCategory.berry),
  Food('Broccoli', FoodColor.green, FoodCategory.cruciferous),
  Food('Carrot', FoodColor.orange, FoodCategory.root),
  Food('Cauliflower', FoodColor.white, FoodCategory.cruciferous),
  Food('Cucumber', FoodColor.green, FoodCategory.fruit),
  Food('Eggplant', FoodColor.purple, FoodCategory.fruit),
  Food('Garlic', FoodColor.white, FoodCategory.bulb),
  Food('Kale', FoodColor.green, FoodCategory.leafyGreen),
  Food('Lentil', FoodColor.brown, FoodCategory.legume),
  Food('Mushroom', FoodColor.brown, FoodCategory.mushroom),
  Food('Pepper (Red)', FoodColor.red, FoodCategory.fruit),
  Food('Spinach', FoodColor.green, FoodCategory.leafyGreen),
  Food('Strawberry', FoodColor.red, FoodCategory.berry),
];
