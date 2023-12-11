
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class Categories extends StatelessWidget {
  final List<String> categories = ["All", "Salad", "Ice cream", "Arabic food", "African food", "Sauces","Sweets","Juices"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
      child: SizedBox(
        height: SizeConfig.defaultSize * 3.5, // 35
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoryItem(context, index),
        ),
      ),
    );
  }

  Widget buildCategoryItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        navigateToCategoryPage(context, categories[index]);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2, // 20
          vertical: SizeConfig.defaultSize * 0.5, // 5
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 1.6), // 16
          border: Border.all(
            color: selectedIndex == index ? kPrimaryColor : Color(0xFFC2C2B5),
          ),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? kPrimaryColor : Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }

  void navigateToCategoryPage(BuildContext context, String category) {
    String routeName = getCategoryPageRoute(category);
    Navigator.pushNamed(context, routeName);
  }

  String getCategoryPageRoute(String category) {
    // Create routes based on categories
    switch (category) {
      case "Salad":
        return 'salad';
      case "Arabic food":
        return 'arabicFood';
      case "Ice cream":
        return 'iceCream';
      case "African food":
        return 'africanFood';
      case "Sauces":
        return "lunch";
      case "Sweets":
        return 'sweets';
      case "Juices":
        return 'juices';
      default:
        return 'all';
    }
  }
}