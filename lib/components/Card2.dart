import 'package:flutter/material.dart';
import 'package:one_project/models/explore_recipe.dart';
import '../fooderlich_theme.dart';
import 'Author_card.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key, required this.recipe});
  final String category = 'Learn to cook';
  final String decription = 'Basic';
  final String cheft = 'Vuong';
  final ExploreRecipe recipe;
  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: const BoxConstraints.expand(
          width: 450,
          height: 550,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/trungcatam.jpg'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            //TODO: Add author imfomation
            const AuthorCard(
              authorName: 'Vuong',
              title: 'Learn to Cook',
              imageProvider: AssetImage('asset/vuong.jpg'),
            ),
            //TODO: Add positioned text
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Text(
                      'Recipes',
                      style: FooderlichTheme.darkTextTheme.headlineLarge,
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 15,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Good Food',
                        style: FooderlichTheme.darkTextTheme.headlineLarge,
                      ),
                    ),
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