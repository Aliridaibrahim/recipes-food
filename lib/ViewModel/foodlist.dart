//
// import 'package:flutter/material.dart';
//
// import '../Services/webservices.dart';
// import '../model/food_model.dart';
//
//
//
// class BooksList with ChangeNotifier{
//   late List<JawadViewModel> foods =[] ;
//
//   Future<void>fetchTopJawads() async{
//
//     final foods = await Webservice().fetchJawads();
//     this.foods= foods.arabicfoods.map((foods) => JawadViewModel(foods as Foods)).toList();
//     notifyListeners();
//   }
// }
// class JawadViewModel{
//
//   final Foods arabicfoods;
//
//   JawadViewModel(this.arabicfoods);
//   List<Africanfood> get title{
//     return arabicfoods.arabicfoods;
//   }
//
//   // Category get foodCategory{
//   //   return arabicfood.category;
//   // }
//
//   List<Africanfood> get picture{
//     return arabicfoods.arabicfoods;
//   }
//   List<Africanfood> get description{
//     return arabicfoods.arabicfoods;
//   }
//   List<Africanfood> get ingredients{
//     return arabicfoods.arabicfoods;
//   }
// }

import 'package:flutter/material.dart';
import '../Services/webservices.dart';
import '../model/food_model.dart';

class BooksList with ChangeNotifier {
  late List<JawadViewModel> foods = [];

  Future<void> fetchTopJawads() async {
    try {
      final foodsData = await Webservice().fetchJawads();
      foods = foodsData.arabicfoods.map((food) => JawadViewModel(food)).toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}

class JawadViewModel {
  final Africanfood food;

  JawadViewModel(this.food);

  String get title {
    return food.title;
  }

  String get picture {
    return food.picture;
  }

  String get description {
    return food.description;
  }

  String get ingredients {
    return food.ingredients;
  }
}