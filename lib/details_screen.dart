import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, String> recipe;
  final bool isFavorite;
  final VoidCallback toggleFavorite;

  const DetailsScreen({
    super.key,
    required this.recipe,
    required this.isFavorite,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe['details']!,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleFavorite,
              child: Text(isFavorite ? 'Unmark Favorite' : 'Mark as Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}

