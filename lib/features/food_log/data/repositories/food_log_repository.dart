import 'package:plantlytics/features/food_log/domain/entities/logged_food.dart';

abstract class FoodLogRepository {
  Stream<List<LoggedFood>> watchAll();
  Future<void> insert(LoggedFood entry);
  Future<void> delete(LoggedFood entry);
  Future<void> clear();
}
