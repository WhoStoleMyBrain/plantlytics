import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plantlytics/features/food_log/data/datasources/local/hive_food_log_repository.dart';
import 'package:plantlytics/features/food_log/data/repositories/food_log_repository.dart';
import 'package:plantlytics/features/food_log/domain/entities/food_color.dart';
import 'package:plantlytics/features/food_log/domain/entities/logged_food.dart';

final foodLogRepoProvider = Provider<FoodLogRepository>((_) {
  return HiveFoodLogRepository(); // or override in tests
});

final loggedFoodsProvider = StreamProvider<List<LoggedFood>>((ref) {
  return ref.watch(foodLogRepoProvider).watchAll();
});

final trailingColorsProvider = Provider<Set<FoodColor>>((ref) {
  final logs = ref.watch(loggedFoodsProvider).value ?? [];
  final cutoff = DateTime.now().subtract(const Duration(days: 7));
  return logs
      .where((e) => e.loggedAt.isAfter(cutoff))
      .map((e) => e.food.color)
      .toSet();
});

Color colorToMaterial(FoodColor fc) {
  switch (fc) {
    case FoodColor.red:
      return Colors.red;
    case FoodColor.orange:
      return Colors.orange;
    case FoodColor.yellow:
      return Colors.yellow;
    case FoodColor.green:
      return Colors.green;
    case FoodColor.blue:
      return Colors.blue;
    case FoodColor.purple:
      return Colors.purple;
    case FoodColor.white:
      return Colors.grey.shade300;
    case FoodColor.brown:
      return Colors.brown;
  }
}
