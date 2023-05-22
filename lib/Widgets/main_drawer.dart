import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Screens/Filter_Screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget BuildList(String txt, IconData c, Function func) {
    return ListTile(
      leading: Icon(c,color: Colors.amber),
      title: Text(
        txt,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: () {
        func();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.only(top: 35),
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.amber,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BuildList('Meal', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuildList('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.filterRout);
          }),
        ],
      ),
    );
  }
}
