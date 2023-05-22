import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_app/Models/category.dart';
import 'package:meal_app/Models/meal.dart';

import '../1.1 dummy_data.dart';
import '../Widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const RouteName = 'category_Screen';
  List<Meal> availablemeal;
  CategoryMealScreen(this.availablemeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}
class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late Map routeArg;
  late List Categorymeal;
  @override
  void didChangeDependencies() {
    print(widget.availablemeal.length);
    routeArg = ModalRoute.of(context)!.settings.arguments as Map;
    Categorymeal = widget.availablemeal.where((element) {
      return element.categories.contains(routeArg['id']);
    }).toList();
    super.didChangeDependencies();
  }

  void StringId(String mealid) {
    setState(() {
      Categorymeal.removeWhere((element) => element.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArg['title']),
        backgroundColor: routeArg['color'],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: Categorymeal[index].title,
            urlImg: Categorymeal[index].imageUrl,
            duration: Categorymeal[index].duration,
            complexity: Categorymeal[index].complexity,
            affordability: Categorymeal[index].affordability,
            id: Categorymeal[index].id,
            color: routeArg['color'],
            RemoveItem: StringId,
          );
        },
        itemCount: Categorymeal.length,
      ),
    );
  }
}
