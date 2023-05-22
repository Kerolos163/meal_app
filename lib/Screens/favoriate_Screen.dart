import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Widgets/meal_item.dart';

class Favoriate extends StatelessWidget {
  List<Meal> favoriatemeal;
  Favoriate(this.favoriatemeal);

  @override
  Widget build(BuildContext context) {
    if (favoriatemeal.isEmpty) {
      return const Center(
        child:  Text("You have no favorites yet - start adding some!",style: TextStyle(fontSize: 19,fontWeight:FontWeight.bold),),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: favoriatemeal[index].title,
            urlImg: favoriatemeal[index].imageUrl,
            duration: favoriatemeal[index].duration,
            complexity: favoriatemeal[index].complexity,
            affordability: favoriatemeal[index].affordability,
            id: favoriatemeal[index].id,
            RemoveItem: (){},
          );
        },
        itemCount: favoriatemeal.length,
      );
    }
  }
}
