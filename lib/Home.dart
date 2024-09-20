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

class Home extends StatefulWidget{
  const Home({super.key, required int curentTab});
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home>{
  //TODO: Add state variable and function here
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    //TODO: Replace with card2
    RecipeScreen(),
    //TODO: Replace with card3
    GroceryScreen(),
  ];

  void _onItemTab(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
      return Consumer<TabManager>(builder: (context, tabManager, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Fooderlich',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          //TODO: Fix issue data load when switch tab and lost position scroll page
          // body: pages[tabManager.selectedTab],
          body: IndexedStack(
            index: tabManager.selectedTab,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: tabManager.selectedTab,
            onTap: (index){
              // tabManager.goToTab(index);
              Provider.of<AppStateManager>(context, listen: false).goToTab(index);
              context.goNamed(
                'home',
                params: {
                  'tab': '${index}',
                }
              );
            },
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