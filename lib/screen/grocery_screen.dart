import 'package:flutter/material.dart';
import '../screen/empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../screen/grocery_item_screen.dart';
import '../screen/grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: Present GroceryItemScreen
          final manager = Provider.of<GroceryManager>(
            context,
            listen: false
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                  onCreate: (item){
                    manager.addItem(item);
                    Navigator.pop(context);
                  },
                  onUpdate: (item){

                  },
              )
            )
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if (manager.groceryItems.isEmpty) {
          return const EmptyGroceryScreen();
        } else {
          // TODO: Add GroceryListScreen
          // return Container(color: Colors.green);
          return GroceryListScreen(manager: manager);
        }
      },
    );
  }
}
