import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.routeName,
      arguments: id,
    );
  }

  String get complexityText {
    if (complexity == Complexity.Simple) return 'Simple';
    if (complexity == Complexity.Challenging) return 'Challenging';
    if (complexity == Complexity.Hard) return 'Hard';
    return 'Unknown';
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) return 'Affordable';
    if (affordability == Affordability.Pricey) return 'Pricey';
    if (affordability == Affordability.Luxurious) return 'Expensive';
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 1000,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: const [
                            Color.fromRGBO(0, 0, 0, 0.60),
                            Color.fromRGBO(0, 0, 0, 0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      // color: const Color.fromRGBO(0, 0, 0, 0.45),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$complexityText')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$affordabilityText')
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
