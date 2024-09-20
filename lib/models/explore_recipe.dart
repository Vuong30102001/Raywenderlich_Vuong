import 'package:one_project/models/card_type.dart';

class ExploreRecipe {
  final String title;
  final String description;
  final String imageUrl;
  final RecipeCardType cardType;

  ExploreRecipe({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.cardType,
  });
}