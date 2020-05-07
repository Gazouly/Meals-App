import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String image;
  final Color color;

  const Category({
    @required this.id,
    @required this.image,
    @required this.title,
    this.color = Colors.orange,
  });
}
