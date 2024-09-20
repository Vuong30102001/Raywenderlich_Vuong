import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_project/models/tab_manager.dart';
import 'package:one_project/navigation/app_router.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';

enum FooderlichTab{
  explore,
  recipes,
  grocery,
}

class EmptyGroceryScreen extends StatelessWidget{
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context){
    // TODO: replace and add layout widgets
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO: Add empty image
          Flexible(
            child: AspectRatio(
              aspectRatio: 16/9,
              child: Image.asset('asset/fooderlich_assets/empty_list.png'),
            ),
          ),
          //TODO: Add empty screen title
          Text(
            'No Groceries',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          //TODO: Add empty screen subtitle
          const SizedBox(height: 16.0,),
          const Text(
            'Shopping for ingredients?\n'
              'Tap the + button to write the down!',
            textAlign: TextAlign.center,
          ),
          //TODO: Add browse recipes button
          MaterialButton(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.green,
            onPressed: (){
              //TODO: Go to Recipe app
              // Provider.of<TabManager>(context, listen: false).goToRecipe();
              context.goNamed(
                'home',
                params: {
                  'tab' : '${FooderlichTab.recipes}',
                }
              );
            },
            child: Text('Browse Recipes'),
          ),
        ],
      ),
    );
  }
}