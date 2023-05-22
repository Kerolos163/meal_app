import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Screens/mealdetailscreen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String urlImg;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Color color;
  final Function RemoveItem;
  MealItem({
    required this.id,
    required this.urlImg,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    this.color = Colors.pink,
    required this.RemoveItem,
  });

  String get GetComplexity {
    switch (complexity) {
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "unknown";
    }
  }

  String get Getaffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "unknown";
    }
  }

  void SelectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.RouteName,
        arguments: {'id': id, 'color': color}).then((value) {
      if (value != null) {
        RemoveItem(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectScreen(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(urlImg,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(15)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 26),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(GetComplexity)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(Getaffordability)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
