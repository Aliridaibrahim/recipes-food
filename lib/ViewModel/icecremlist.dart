
import 'package:flutter/material.dart';
import '../Services/webservices.dart';
import '../model/food_model.dart';

class IcecreamList with ChangeNotifier {
  late List<JawadViewModel> foods = [];

  Future<void> fetchTopJawads() async {
    try {
      final foodsData = await Webservice().fetchJawads();
      foods = foodsData.iceCream.map((food) => JawadViewModel(food)).toList();
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