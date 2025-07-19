import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plantlytics/core/layout/main_shell.dart';
import 'package:plantlytics/features/food_log/presentation/providers/logged_foods_provider.dart';
import 'package:plantlytics/features/food_log/presentation/views/food_log_route.dart';

/// Global [GoRouter] provider that wires up the three demo routes.
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true, // helpful during development
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, __) => const MainShell()),
      GoRoute(
        path: '/foodlog',
        name: FoodLogRoute.name,
        builder: (context, state) => const FoodLogRoute(),
      ),
      GoRoute(
        path: '/discover',
        name: DiscoverRoute.name,
        builder: (context, state) => const DiscoverRoute(),
      ),
      GoRoute(
        path: '/settings',
        name: SettingsRoute.name,
        builder: (context, state) => const SettingsRoute(),
      ),
    ],
  );
});

/// Placeholder screen for the Discover feature.
class DiscoverRoute extends StatelessWidget {
  static const String name = 'discover';

  const DiscoverRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discover')),
      body: const Center(child: Text('Discover Screen')),
    );
  }
}

/// Placeholder screen for the Settings feature.
class SettingsRoute extends ConsumerWidget {
  static const String name = 'settings';

  const SettingsRoute({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          const Center(child: Text('Settings Screen')),
          ElevatedButton(
            onPressed: ref.read(foodLogRepoProvider).clear,
            child: Text("Delete all data?"),
          ),
        ],
      ),
    );
  }
}
