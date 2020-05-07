import 'package:flutter/material.dart';

import '../../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final Color color;

  const CategoryItem({
    @required this.id,
    @required this.title,
    @required this.color,
    @required this.image,
  });

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // padding: const EdgeInsets.all(15),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       color.withOpacity(0.7),
        //       color,
        //     ],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
                    // fontSize: 24,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Text(
//           title,
//           style: Theme.of(context).textTheme.title,
//         ),
