import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => Text(meals[index].title),
    );

    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh ... nothing here!', style: TextStyle(fontSize: 24),),
          const SizedBox(
            height: 16,
          ),
          Text('Try selecting a different category please!')
        ],
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
