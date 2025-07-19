import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plantlytics/core/layout/router_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/food_log/domain/entities/food_color.dart';
import 'features/food_log/domain/entities/food_category.dart';
import 'features/food_log/domain/entities/food.dart';
import 'features/food_log/domain/entities/logged_food.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Fruit & Veg Tracker',
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive
    ..registerAdapter(FoodColorAdapter())
    ..registerAdapter(FoodCategoryAdapter())
    ..registerAdapter(FoodAdapter())
    ..registerAdapter(LoggedFoodAdapter());

  await Hive.openBox<LoggedFood>('loggedFoods');

  runApp(const ProviderScope(child: MyApp()));
}
