import 'package:flutter/material.dart';
import 'package:meals_app/favourites_provider.dart';
import 'package:meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsDetails extends ConsumerWidget {
  const MealsDetails({super.key, required this.meal});

  final Meal meal;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteProvider);
    final isFavourite = favouriteMeals.contains(meal); 
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref.read(favouriteProvider.notifier).toggleFavouriteStatus(meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded ? 'Meal added as a favourite' : 'Meal removed.'),
                  ),);                
              },
              icon: Icon(isFavourite ? Icons.star : Icons.star_border),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            SizedBox(
              height: 14,
            ),

            Text(
              'Ingredients',
              style: TextStyle(fontSize: 24, color: Colors.orange),
            ),
            SizedBox(
              height: 10,
            ),
            for (final ingredient in meal.ingredients) Text(ingredient),

            SizedBox(
              height: 14,
            ),

            Text(
              'Steps',
              style: TextStyle(fontSize: 24, color: Colors.orange),
            ),
            SizedBox(
              height: 10,
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}
