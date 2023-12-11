import 'package:flutter/material.dart';

class RecipeBundle {
  final int id;
  final String title, description, imageSrc;
  final Color color;

  RecipeBundle(
      {required this.id,
        required this.title,
        required this.description,
        required this.imageSrc,
        required this.color});
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    title: "Salades",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/d.png",
    color: Color(0xFFD82D40),
  ),
  RecipeBundle(
    id: 2,
    title: "Ice Cream",
    description: "Cook recipes for special ",
    imageSrc: "assets/images/g.png",
    color: Color(0xFF90AF17),
  ),
  RecipeBundle(
    id: 3,
    title: "Arabic food",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/f.png",
    color: Color(0xFF2DBBD8),
  ),
  RecipeBundle(
    id: 4,
    title: "African food",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/ss.png",
    color: Colors.orange

  ),
  RecipeBundle(
    id: 5,
    title: "Sauces",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/gg.png",
    color: Colors.green,
  ),
  RecipeBundle(
    id: 6,
    title: "Sweets",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/m.png",
    color: Colors.cyan,
  ),
  RecipeBundle(
    id: 7,
    title: "Juices",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/b.png",
    color: Colors.red,
  ),
];
