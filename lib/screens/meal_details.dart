import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final String mealID = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    final mediaQuery = MediaQuery.of(context);

    List<Widget> titleBuilder(String title) {
      return [
        Text(
          '$title',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ];
    }

    Widget infoItem({String text, IconData icon}) {
      return Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
      );
    }

    Widget listBuilder({IconData icon, String txt}) {
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    txt,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      );
    }

    String complexityText(complexity) {
      if (complexity == Complexity.Simple) {
        return 'You can easily prepare this recipe';
      }
      if (complexity == Complexity.Challenging) {
        return 'You may face some difficulties in performing this recipe';
      }
      if (complexity == Complexity.Hard) {
        return 'This recipe is hard to prepare';
      }
      return 'Unknown';
    }

    String affordableText(affordability) {
      if (affordability == Affordability.Affordable) {
        return 'The ingredients of the recipe are cheap';
      }
      if (affordability == Affordability.Pricey) {
        return 'Some ingredients are pricey';
      }
      if (affordability == Affordability.Luxurious) {
        return 'The ingredients are expensive';
      }
      return 'Unknown';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: mediaQuery.size.height,
            ),
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                margin: const EdgeInsets.only(
                  top: 250,
                  bottom: 0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ...titleBuilder('GENERAL INFO'),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      child: Column(
                        children: <Widget>[
                          infoItem(
                            icon: Icons.schedule,
                            text:
                                'You can cook this recipe within ${meal.duration} minutes',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          infoItem(
                            icon: Icons.fastfood,
                            text: complexityText(meal.complexity),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          infoItem(
                            icon: Icons.attach_money,
                            text: affordableText(meal.affordability),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...titleBuilder('RECIPE SPECS'),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      child: Column(
                        children: <Widget>[
                          infoItem(
                            icon: meal.isVegan
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            text: 'Vegan Recipe',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          infoItem(
                            icon: meal.isLactoseFree
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            text: 'Lactose Free Recipe',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          infoItem(
                            icon: meal.isGlutenFree
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            text: 'Gluten Free Recipe',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...titleBuilder('INGREDIENTS'),
                    ...meal.ingredients.map((it) {
                      return listBuilder(
                        icon: Icons.offline_bolt,
                        txt: it,
                      );
                    }).toList(),
                    const SizedBox(
                      height: 20,
                    ),
                    ...titleBuilder('RECIPE STEPS'),
                    ...meal.steps.map((it) {
                      return listBuilder(
                        icon: Icons.label_important,
                        txt: it,
                      );
                    }).toList(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
