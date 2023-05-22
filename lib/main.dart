import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_app/Models/meal.dart';
import '1.1 dummy_data.dart';
import 'Screens/Filter_Screen.dart';
import 'Screens/Tab_Screen.dart';
import 'Screens/categories_screen.dart';
import 'Screens/category_meal_screen.dart';
import 'Screens/mealdetailscreen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ]
  );

  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };

  List<Meal> availablemeal = DUMMY_MEALS;
  List<Meal> favoriatemeal = [];

  void setfilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      availablemeal = DUMMY_MEALS.where((meal) {
        if (_filters['Gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['Vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters['Vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

void Togglefavoriate(String mealid)
{
  final ExIndex= favoriatemeal.indexWhere((element) => element.id==mealid);

  if(ExIndex>=0)
  {
    setState(() {
      favoriatemeal.removeAt(ExIndex);

    });
  }
  else
  {
    setState(() {
      favoriatemeal.add(DUMMY_MEALS.firstWhere((element) => element.id==mealid));
    });
  }

}

bool isfavoriate(String MealId)
{
  return favoriatemeal.any((element) => element.id==MealId);
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              titleMedium: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: const MyHomePage(),
      routes: {
        '/': (context) =>  TabScreen(favoriatemeal),
        CategoryMealScreen.RouteName: (context) =>
            CategoryMealScreen(availablemeal),
        MealDetail.RouteName: (context) => MealDetail(Togglefavoriate,isfavoriate),
        FilterScreen.filterRout: (context) =>
            FilterScreen(setfilters, _filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: Categoryscreen(),
    );
  }
}
