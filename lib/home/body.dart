import 'package:flutter/material.dart';
import 'package:recipesfood/home/recipeBundelmodel.dart';
import 'package:recipesfood/home/recipe_bundel.dart';

import '../utils/dimensions.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Categories(),
          Expanded(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: GridView.builder(
                itemCount: recipeBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                  SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:
                  SizeConfig.orientation == Orientation.landscape
                      ? SizeConfig.defaultSize * 2
                      : 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => RecipeBundelCard(
                  recipeBundle: recipeBundles[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
