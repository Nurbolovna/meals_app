import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
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
              'Ingredients', style: TextStyle(fontSize: 24, color: Colors.orange),
            ),
            SizedBox(
              height: 10,
            ),
            for(final ingredient in meal.ingredients)
            Text(ingredient),
            //style: Theme.of(context)
            //       .textTheme
            //       .bodyMedium!
            //       .copyWith(color: Theme.of(context).colorScheme.background),
          
           SizedBox(
              height: 14,
            ),
        
            Text(
              'Steps', style: TextStyle(fontSize: 24, color: Colors.orange),
            ),
            SizedBox(
              height: 10,
            ),
            for(final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(step, textAlign: TextAlign.center,),
            ) 
          ],
        ),
      ),
    );
  }
}
