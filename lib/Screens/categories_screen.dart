import 'package:flutter/material.dart';

import '../1.1 dummy_data.dart';
import '../Widgets/Category_Item.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title:const Text("Meal")),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((e) {
          return CategoryItem(e.id, e.title, e.color);
        }).toList(),
      ),
    );
  }
}
