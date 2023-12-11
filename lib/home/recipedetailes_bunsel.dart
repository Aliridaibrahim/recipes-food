import 'package:flutter/material.dart';
import 'package:recipesfood/home/recipeBundelmodel.dart';


class RecipeDetailsPage extends StatelessWidget {
  final RecipeBundle recipeBundle;

  const RecipeDetailsPage({required this.recipeBundle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeBundle.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Title: ${recipeBundle.title}'),
            Text('Description: ${recipeBundle.description}'),
            // Add more details as needed...
          ],
        ),
      ),
    );
  }
}