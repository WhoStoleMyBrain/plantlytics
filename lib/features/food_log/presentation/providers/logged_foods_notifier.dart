// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:plantlytics/features/food_log/domain/entities/food.dart';
// import 'package:plantlytics/features/food_log/domain/entities/food_color.dart';

// class LoggedFoodsNotifier extends StateNotifier<List<Food>> {
//   LoggedFoodsNotifier() : super(const []);
//   void addFood(Food food) => state = [...state, food];
// }

// final loggedFoodsProvider =
//     StateNotifierProvider<LoggedFoodsNotifier, List<Food>>(
//       (_) => LoggedFoodsNotifier(),
//     );

// final loggedColorsProvider = Provider<Set<FoodColor>>((ref) {
//   final foods = ref.watch(loggedFoodsProvider);
//   return foods.map((f) => f.color).toSet();
// });

// Color colorToMaterial(FoodColor fc) {
//   switch (fc) {
//     case FoodColor.red:
//       return Colors.red;
//     case FoodColor.orange:
//       return Colors.orange;
//     case FoodColor.yellow:
//       return Colors.yellow;
//     case FoodColor.green:
//       return Colors.green;
//     case FoodColor.blue:
//       return Colors.blue;
//     case FoodColor.purple:
//       return Colors.purple;
//     case FoodColor.white:
//       return Colors.grey.shade300;
//     case FoodColor.brown:
//       return Colors.brown;
//   }
// }
