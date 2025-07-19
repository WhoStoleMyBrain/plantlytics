import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plantlytics/features/colour_recommendations/presentation/providers/suggestion_provider.dart';
import 'package:plantlytics/features/food_log/domain/entities/food.dart';
import 'package:plantlytics/features/food_log/domain/entities/food_color.dart';
import 'package:plantlytics/features/food_log/domain/entities/food_options.dart';
import 'package:plantlytics/features/food_log/domain/entities/logged_food.dart';
import 'package:plantlytics/features/food_log/presentation/providers/logged_foods_provider.dart';

class FoodLogRoute extends ConsumerWidget {
  static const String name = 'foodLog';
  const FoodLogRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedFoods = ref.watch(loggedFoodsProvider);
    final trailingColors = ref.watch(trailingColorsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Food Log')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Autocomplete<Food>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<Food>.empty();
                  }
                  return kFoodOptions.where(
                    (food) => food.name.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    ),
                  );
                },
                displayStringForOption: (Food option) => option.name,
                onSelected: (Food selection) {
                  ref
                      .read(foodLogRepoProvider)
                      .insert(LoggedFood(selection, DateTime.now()));
                },
                fieldViewBuilder:
                    (context, controller, focusNode, onEditingComplete) =>
                        TextField(
                          controller: controller,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          decoration: const InputDecoration(
                            labelText: 'Search & add food',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
              ),
              const SizedBox(height: 16),
              Text(
                'Colours logged: ${trailingColors.map((c) => c.name).join(', ')}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      sections: FoodColor.values.map((c) {
                        final has = trailingColors.contains(c);
                        return PieChartSectionData(
                          value: has ? 1 : 0.001, // keeps slice visible
                          color: colorToMaterial(
                            c,
                          ).withValues(alpha: has ? 1 : .15),
                          title: '', // legend via chips
                        );
                      }).toList(),
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                    ),
                  ),
                ),
              ),
              ref
                  .watch(suggestionProvider)
                  .when(
                    data: (food) => food == null
                        ? const Text('Rainbow complete! 🎉')
                        : ActionChip(
                            label: Text('Try ${food.name}'),
                            onPressed: () => ref
                                .read(foodLogRepoProvider)
                                .insert(LoggedFood(food, DateTime.now())),
                          ),
                    loading: () => const CircularProgressIndicator(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
              const SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: loggedFoods.value?.length ?? 0,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final loggedFood = loggedFoods.value![index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colorToMaterial(loggedFood.food.color),
                      ),
                      title: Text(loggedFood.food.name),
                      subtitle: Text(loggedFood.food.category.name),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
