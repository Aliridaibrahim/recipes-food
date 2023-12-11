import 'package:flutter/material.dart';
import 'package:recipesfood/home/africanfood.dart';
import 'package:recipesfood/home/arabicfood.dart';
import 'package:recipesfood/home/ice_cream.dart';
import 'package:recipesfood/home/juices.dart';
import 'package:recipesfood/home/recipeBundelmodel.dart';
import 'package:recipesfood/home/salad.dart';
import 'package:recipesfood/home/sauces.dart';
import 'package:recipesfood/home/sweets.dart';
import 'package:svg_flutter/svg.dart';
import '../utils/dimensions.dart';

class RecipeBundelCard extends StatelessWidget {
  final  RecipeBundle recipeBundle;


  const RecipeBundelCard({ required this.recipeBundle})
  ;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // Now we dont this Aspect ratio
    return GestureDetector(
    //  onTap: press,
      onTap: () {
        navigateToScreen(context, recipeBundle);
      },
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
          borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      recipeBundle.title,
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, //22
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      recipeBundle.description,
                      style: const TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    SizedBox(height: defaultSize * 0.5), //5
                    const Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.5), //5
            AspectRatio(
              aspectRatio: 0.71,
              child: Image.asset(
                recipeBundle.imageSrc,
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {required String iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize), // 10
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
  void navigateToScreen(BuildContext context, RecipeBundle recipeBundle) {
    if (recipeBundle.id == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Arabicfood()),
      );
    } else if (recipeBundle.id == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IceCream()),
      );
    }
    else if (recipeBundle.id == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const Salad()),
      );
    }
    else if (recipeBundle.id == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AfricanFood()),
      );
    }else if (recipeBundle.id == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Sauces()),
      );
    }else if (recipeBundle.id == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Sweets()),
      );
    }else if (recipeBundle.id == 7) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Juices()),
      );
    }
    // Add more conditions for other RecipeBundle IDs if needed
  }

}
