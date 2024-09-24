import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> recipes = [
    {
      'name': 'Pizza',
      'details': '''
      Ingredients:
      - 2 cups all-purpose flour
      - 1 cup tomato sauce
      - 1 cup mozzarella cheese
      - 1 tablespoon olive oil
      - 1 teaspoon salt
      - 1 teaspoon sugar
      - 1 teaspoon active dry yeast
      '''
    },
    {
      'name': 'Mashed Potatoes',
      'details': '''
      Ingredients:
      - 4 large russet potatoes, peeled and cut into chunks
      - 1/2 cup whole milk
      - 3 tablespoons unsalted butter
      - Salt and pepper to taste
      - 2 tablespoons sour cream (optional)
      - 1 clove garlic, minced (optional)
      '''
    },
    {
      'name': 'Mac and Cheese',
      'details': '''
      Ingredients:
      - 2 cups elbow macaroni
      - 2 cups shredded cheddar cheese
      - 1/2 cup whole milk
      - 1/4 cup butter
      - 1/4 cup all-purpose flour
      - 1/2 teaspoon salt
      - 1/4 teaspoon black pepper
      - 1/4 teaspoon paprika (optional)
      '''
    },
  ];

  final List<Map<String, String>> favorites = [];

  void toggleFavorite(Map<String, String> recipe) {
    setState(() {
      favorites.contains(recipe) ? favorites.remove(recipe) : favorites.add(recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients and Favorite dishes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favorites: favorites),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipe: recipes[index],
                    isFavorite: favorites.contains(recipes[index]),
                    toggleFavorite: () => toggleFavorite(recipes[index]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favorites;

  const FavoritesScreen({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorite recipes yet.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favorites[index]['name']!),
                );
              },
            ),
    );
  }
}


