import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plantlytics/core/layout/router_provider.dart';
import 'package:plantlytics/features/food_log/presentation/views/food_log_route.dart';

class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  int _index = 0;

  // Store the actual route widgets; no need to call .build manually.
  static final _screens = <Widget>[
    const FoodLogRoute(),
    const DiscoverRoute(),
    const SettingsRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Log'),
          BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Stats'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
