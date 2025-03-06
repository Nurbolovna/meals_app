import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  String get Complexity{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1); 
  }

    String get Affordability{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1); 
  }


  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover, 
                height: 200, 
                width: double.infinity, 
              ),
              Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.schedule, size: 17, color: Colors.white,), 
                            SizedBox(width: 6,), 
                            Text(meal.duration.toString(), style: TextStyle(color: Colors.white),), 

                            SizedBox(width: 12,), 

                            Icon(Icons.work, size: 17, color: Colors.white,), 
                            SizedBox(width: 6,), 
                            Text(Complexity, style: TextStyle(color: Colors.white),), 

                            SizedBox(width: 12,), 

                            Icon(Icons.attach_money, size: 17, color: Colors.white,), 
                            SizedBox(width: 6,), 
                            Text(Affordability, style: TextStyle(color: Colors.white),), 
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
