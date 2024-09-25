import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_project/models/app_state_manager.dart';
import 'package:one_project/models/tab_manager.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';

enum FooderlichTab {
  explore,
  recipes,
  grocery,
}

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset('asset/fooderlich_assets/empty_list.png'),
            ),
          ),
          Text(
            'No Groceries',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Shopping for ingredients?\n'
                'Tap the + button to write them down!',
            textAlign: TextAlign.center,
          ),
          MaterialButton(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.green,
            onPressed: () {
              print('Button Press!'); // Log thông tin khi nút được nhấn
              // Provider.of<AppStateManager>(context, listen: false).goToTab(FooderlichTab.recipes.index);
              context.goNamed(
                'home',
                pathParameters: {
                  'tab': '${FooderlichTab.recipes.index}', // Chuyển chỉ số tab công thức
                },
              );
            },

            child: Text('Browse Recipes'),
          ),
        ],
      ),
    );
  }
}
