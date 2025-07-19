import 'package:hive/hive.dart';
import 'food.dart';

part 'logged_food.g.dart';

@HiveType(typeId: 3)
class LoggedFood extends HiveObject {
  @HiveField(0)
  final Food food;

  @HiveField(1)
  final DateTime loggedAt;

  LoggedFood(this.food, this.loggedAt);
}
