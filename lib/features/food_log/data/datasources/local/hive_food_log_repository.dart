import 'package:hive/hive.dart';
import 'package:plantlytics/features/food_log/data/repositories/food_log_repository.dart';
import 'package:plantlytics/features/food_log/domain/entities/logged_food.dart';

class HiveFoodLogRepository extends FoodLogRepository {
  static const _boxName = 'loggedFoods';
  final Box<LoggedFood> _box = Hive.box<LoggedFood>(_boxName);

  @override
  Future<void> insert(LoggedFood entry) => _box.add(entry);

  @override
  Future<void> delete(LoggedFood entry) => entry.delete();

  @override
  Stream<List<LoggedFood>> watchAll() =>
      _box.watch().map((_) => _box.values.toList(growable: false));
}
