import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../Widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favoriate_Screen.dart';

class TabScreen extends StatefulWidget {
  List<Meal> favoriatemeal;
  TabScreen(this.favoriatemeal);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List page;
  int IndexPage = 0;
  selectedpage(int value) {
    setState(() {
      IndexPage = value;
    });
  }

  @override
  void initState() {
    page = [
      {'page': const Categoryscreen(), 'title': "Categories"},
      {'page': Favoriate(widget.favoriatemeal), 'title': "Favorites"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(page[IndexPage]['title']),
        ),
        body: page[IndexPage]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectedpage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          currentIndex: IndexPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites",
            ),
          ],
        ),
        drawer: const MainDrawer());
  }
}
