import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_project/models/app_state_manager.dart';
import 'package:one_project/models/tab_manager.dart';
import 'package:one_project/navigation/app_router.dart';
import 'components/Card1.dart';
import 'components/Card2.dart';
import 'components/Card3.dart';
import 'screen/explore_screen.dart';
import 'screen/recipes_screen.dart';
import 'screen/grocery_screen.dart';
import 'models/models.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final int currentTab;

  const Home({super.key, required this.currentTab});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    // Khởi tạo _selectedIndex dựa trên curentTab từ widget
    _selectedIndex = widget.currentTab;
  }

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipeScreen(),
    GroceryScreen(),
  ];

  void _onItemTab(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // In ra thông tin để kiểm tra
    print('Navigating to tab: $index');

    // Cập nhật tab trong AppStateManager
    Provider.of<AppStateManager>(context, listen: false).goToTab(index);
    // Cập nhật đường dẫn với GoRouter
    context.goNamed(
      'home',
      pathParameters: {'tab': '$index'},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        // Cập nhật _selectedIndex từ selectedTab trong AppStateManager
        _selectedIndex = appStateManager.selectedTab;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Fooderlich',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
            ),
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme
                .of(context)
                .textSelectionTheme
                .selectionColor,
            currentIndex: _selectedIndex,
            onTap: _onItemTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy',
              ),
            ],
          ),
        );
      },
    );
  }
}
