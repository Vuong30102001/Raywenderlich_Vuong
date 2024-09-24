import 'package:flutter/material.dart';
import 'package:one_project/models/app_state_manager.dart';
import 'package:one_project/models/models.dart';
import 'package:one_project/models/profile_manager.dart';
import 'package:one_project/models/grocery_manager.dart';
import 'package:provider/provider.dart';
import 'package:one_project/fooderlich_theme.dart';
import 'package:one_project/Home.dart';
import 'package:one_project/navigation/app_router.dart';

void main() {
  runApp(const Foderling());
}

class Foderling extends StatefulWidget {
  const Foderling({super.key});

  @override
  State<Foderling> createState() => _FoderlingState();
}

class _FoderlingState extends State<Foderling> {
  late final AppStateManager _appStateManager = AppStateManager();
  late final ProfileManager _profileManager = ProfileManager();
  late final GroceryManager _groceryManager = GroceryManager();
  late final TabManager _tabManager = TabManager();
  late final AppRouter _appRouter = AppRouter(
    _appStateManager,
    _profileManager,
    _groceryManager,
    _tabManager,
  );

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _appStateManager),
        ChangeNotifierProvider.value(value: _profileManager),
        ChangeNotifierProvider.value(value: _groceryManager),
        ChangeNotifierProvider.value(value: _tabManager),
        // Other providers if needed
      ],
      child: MaterialApp.router(
        // Apply theme
        theme: theme,
        title: 'Foderling',
        routerDelegate: _appRouter.router.routerDelegate,
        routeInformationParser: _appRouter.router.routeInformationParser,
        routeInformationProvider: _appRouter.router.routeInformationProvider,
      ),
    );
  }
}
