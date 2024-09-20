import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:one_project/models/explore_recipe.dart';
import '../fooderlich_theme.dart';

class Card3 extends StatelessWidget{
  const Card3({super.key, required this.recipe});
  final ExploreRecipe recipe;
  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/hi.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            //TODO: Add dark overlay BoxDecoration
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            // TODO: Container, Column, Icon and Text
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    'Recipes Trends',
                    style: FooderlichTheme.darkTextTheme.headlineMedium,
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
            // TODO: Add Center Widget with Chip Widget children
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: [
                  Chip(
                    label:
                    Text(
                      'Carot',
                      style: FooderlichTheme.darkTextTheme.headlineSmall,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.6),
                    onDeleted: (){
                      log('delete');
                    },
                  ),
                  Chip(
                    label:
                    Text(
                      'Potatoo',
                      style: FooderlichTheme.darkTextTheme.headlineSmall,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.6),
                    onDeleted: (){
                      log('delete');
                    },
                  ),
                  Chip(
                    label:
                      Text(
                        'Banana',
                        style: FooderlichTheme.darkTextTheme.headlineSmall,
                      ),
                      backgroundColor: Colors.black.withOpacity(0.6),
                      onDeleted: (){
                        log('delete');
                      },
                  ),
                  Chip(
                    label:
                    Text(
                      'snack',
                      style: FooderlichTheme.darkTextTheme.headlineSmall,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.6),
                  ),
                  Chip(
                    label:
                    Text(
                      'kiwi',
                      style: FooderlichTheme.darkTextTheme.headlineSmall,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.6),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}