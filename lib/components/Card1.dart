import 'package:flutter/material.dart';
import 'package:one_project/models/explore_recipe.dart';
import '../fooderlich_theme.dart';

class Card1 extends StatelessWidget{
  const Card1({super.key, required this.recipe});
  final String category = 'Editor\'s choice';
  final String title = 'The Art of though';
  final String decription = 'Learn to make the perfect bread';
  final String chef = 'Master Vuong';
  final ExploreRecipe recipe;
  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 450,
          height: 550,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/banhmi.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        //TODO: Add stack of text
        child: Stack(
          children: [
            Text(
              category,
              style: FooderlichTheme.darkTextTheme.bodySmall,
            ),
            Positioned(
              top: 20,
              child: Text(
                title,
                style: FooderlichTheme.darkTextTheme.headlineLarge,
              ),
            ),
            Positioned(
              bottom: 30,
              child: Text(
                decription,
                style: FooderlichTheme.darkTextTheme.headlineMedium,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                chef,
                style: FooderlichTheme.darkTextTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}