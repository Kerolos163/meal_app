import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meal_app/1.1 dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const RouteName = 'mealdetails';
  Function togFavoriate;
  Function isfavoriate;
  MealDetail(this.togFavoriate, this.isfavoriate);

  Widget BuildTitle(BuildContext context, String Title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        Title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget BuildContainer(Widget c) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        height: 200,
        width: 300,
        child: c);
  }

  @override
  Widget build(BuildContext context) {
    final mapinfo = ModalRoute.of(context)!.settings.arguments as Map;
    final SelectedMeal = DUMMY_MEALS.firstWhere(
      (element) {
        return element.id == mapinfo['id'];
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(SelectedMeal.title),
        backgroundColor: mapinfo['color'],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 300,
              width: double.infinity,
              child: Image.network(SelectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            BuildTitle(context, "Ingredients"),
            BuildContainer(ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(SelectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: SelectedMeal.ingredients.length)),
            BuildTitle(context, "Steps"),
            BuildContainer(ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(SelectedMeal.steps[index]),
                        leading: CircleAvatar(
                          child: Text(
                            "# ${index + 1}",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.amber,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: .3,
                      )
                    ],
                  );
                },
                itemCount: SelectedMeal.steps.length)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pop( mapinfo['id']);
          togFavoriate(mapinfo['id']);
        },
        backgroundColor: mapinfo['color'],
        child: isfavoriate(mapinfo['id'])
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }
}
