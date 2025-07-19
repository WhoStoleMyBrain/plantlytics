import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plantlytics/features/food_log/domain/entities/food.dart';
import 'package:plantlytics/features/food_log/domain/entities/food_color.dart';
import 'package:plantlytics/features/food_log/domain/entities/food_options.dart';
import 'package:plantlytics/features/food_log/presentation/providers/logged_foods_provider.dart';

final suggestionProvider = FutureProvider<Food?>((ref) async {
  final missing = FoodColor.values
      .where((c) => !ref.watch(trailingColorsProvider).contains(c))
      .toList();
  if (missing.isEmpty) return null;
  final colour = missing.first; // or random
  final options = kFoodOptions.where((f) => f.color == colour);
  return options.isNotEmpty ? options.first : null;
});
