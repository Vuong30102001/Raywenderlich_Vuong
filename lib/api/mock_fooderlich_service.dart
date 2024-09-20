import '../models/models.dart';

// ExploreData serves as a data container that holds
// list of restaurants, food categories, friend posts, and today's recipes.
class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;
  final List<ExploreRecipe> todayRecipes; // Thêm todayRecipes

  ExploreData(
      this.restaurants,
      this.categories,
      this.friendPosts,
      this.todayRecipes, // Thêm todayRecipes
      );
}

// Mock Yummy service that grabs sample data to mock up a food app request/response
class MockFooderlichService {
  // Batch request that gets restaurants, categories, friend posts, and today recipes
  Future<ExploreData> getExploreData() async {
    final restaurants = await _getRestaurants();
    final categories = await _getCategories();
    final friendPosts = await _getFriendFeed();
    final todayRecipes = await _getTodayRecipes(); // Lấy todayRecipes

    return ExploreData(restaurants, categories, friendPosts, todayRecipes);
  }

  // Get sample food categories to display in UI
  Future<List<FoodCategory>> _getCategories() async {
    // Simulate API request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Return mock categories
    return categories;
  }

  // Get the friend posts to display in UI
  Future<List<Post>> _getFriendFeed() async {
    // Simulate API request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Return mock posts
    return posts;
  }

  // Get the restaurants to display in UI
  Future<List<Restaurant>> _getRestaurants() async {
    // Simulate API request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Return mock restaurants
    return restaurants;
  }

  // Get today's recipes to display in UI
  Future<List<ExploreRecipe>> _getTodayRecipes() async {
    // Simulate API request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Return mock today's recipes
    return [
      ExploreRecipe(
        title: 'Pasta',
        description: 'Delicious homemade pasta',
        imageUrl: 'https://example.com/pasta.jpg',
        cardType: RecipeCardType.card1,
      ),
      ExploreRecipe(
        title: 'Pizza',
        description: 'Cheesy and crispy pizza',
        imageUrl: 'https://example.com/pizza.jpg',
        cardType: RecipeCardType.card2
      ),
      ExploreRecipe(
          title: 'Pizza',
          description: 'Cheesy and crispy pizza',
          imageUrl: 'https://example.com/pizza.jpg',
          cardType: RecipeCardType.card3
      )
      // Add more mock recipes as needed...
    ];
  }

  Future<List<SimpleRecipe>> getRecipes() async {
    await Future.delayed(const Duration(microseconds: 1000));
    return [
      SimpleRecipe(
        title: 'Burgur Carbonara',
        duration: '20 mins',
        thumbnailUrl: 'https://example.com/burgur.jpg',
        dishImage: 'asset/food_pic/burger.png'
      ),
      SimpleRecipe(
        title: 'coffee',
        duration: '10 mins',
        thumbnailUrl: 'https://example.com/coffee.jpg',
        dishImage: 'asset/food_pic/coffee.png'
      ),
      SimpleRecipe(
          title: 'coffee',
          duration: '10 mins',
          thumbnailUrl: 'https://example.com/coffee.jpg',
          dishImage: 'asset/food_pic/coffee.png'
      ),
      SimpleRecipe(
          title: 'coffee',
          duration: '10 mins',
          thumbnailUrl: 'https://example.com/coffee.jpg',
          dishImage: 'asset/food_pic/coffee.png'
      ),
      SimpleRecipe(
          title: 'coffee',
          duration: '10 mins',
          thumbnailUrl: 'https://example.com/coffee.jpg',
          dishImage: 'asset/food_pic/coffee.png'
      ),
      SimpleRecipe(
          title: 'coffee',
          duration: '10 mins',
          thumbnailUrl: 'https://example.com/coffee.jpg',
          dishImage: 'asset/food_pic/coffee.png'
      ),
      SimpleRecipe(
          title: 'coffee',
          duration: '10 mins',
          thumbnailUrl: 'https://example.com/coffee.jpg',
          dishImage: 'asset/food_pic/coffee.png'
      ),
      SimpleRecipe(
          title: 'coffee',
          duration: '10 mins',
          thumbnailUrl: 'https://example.com/coffee.jpg',
          dishImage: 'asset/food_pic/coffee.png'
      ),
      SimpleRecipe(
          title: 'coffee',
          duration: '10 mins',
          thumbnailUrl: 'https://example.com/coffee.jpg',
          dishImage: 'asset/food_pic/coffee.png'
      ),
      // Add more simple recipe ...
    ];
  }
}
