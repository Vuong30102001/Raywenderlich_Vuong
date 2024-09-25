import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_project/Home.dart';
import 'package:one_project/fooderlich_theme.dart';
import 'package:one_project/models/app_state_manager.dart';
import 'package:one_project/screen/empty_grocery_screen.dart';
import 'package:one_project/screen/grocery_item_screen.dart';
import '../models/models.dart';
import '../screen/screen.dart';

class AppRouter {
  final AppStateManager appStateManager;
  final ProfileManager profileManager;
  final GroceryManager groceryManager;
  final TabManager tabManager;

  AppRouter(
      this.appStateManager,
      this.profileManager,
      this.groceryManager,
      this.tabManager,
      );

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/login',
    routes: [
      // Route cho màn hình đăng nhập
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      // Route cho màn hình onboarding
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      // Route cho màn hình chính
      GoRoute(
        name: 'home',
        path: '/:tab',
        builder: (context, state) {
          final tab = int.tryParse(state.pathParameters['tab'] ?? '') ?? 0;
          return Home(
            key: state.pageKey,
            currentTab: tab,
          );
        },
        routes: [
          // Subroute cho màn hình chi tiết mục
          GoRoute(
            name: 'item',
            path: 'item/:id',
            builder: (context, state) {
              final itemId = state.pathParameters['id'] ?? '';
              final itemIndex = groceryManager.groceryItems.indexWhere((item) => item.id ==itemId);
              final item = groceryManager.getGroceryItem(itemId);
              return GroceryItemScreen(
                originalItem: item,
                onCreate: (newItem) {
                  groceryManager.addItem(newItem);
                },
                onUpdate: (item) {
                  // Cần thêm index ở đây nếu cần
                  if(itemIndex != -1){
                    groceryManager.updateItem(item, itemIndex);
                  }
                },
              );
            },
          ),
          // TODO: Thêm subroute cho Profile nếu cần
        ],
      ),
    ],
    // Xử lý lỗi
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
    // Xử lý chuyển hướng
    redirect: (context, state) {
      final loggedIn = appStateManager.isLoggedIn;
      final loggingIn = state.matchedLocation == '/login';

      if (!loggedIn) return loggingIn ? null : '/login';

      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      final onboarding = state.matchedLocation == '/onboarding';

      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
      }

      if (loggingIn || onboarding) return '/${FooderlichTab.explore}';

      return null;
    },
  );
}
