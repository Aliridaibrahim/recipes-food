// // // To parse this JSON data, do
// // //
// // //     final jawad = jawadFromJson(jsonString);
// //
// // import 'package:meta/meta.dart';
// // import 'dart:convert';
// //
// // Jawad jawadFromJson(String str) => Jawad.fromJson(json.decode(str));
// //
// // String jawadToJson(Jawad data) => json.encode(data.toJson());
// //
// // class Jawad {
// //   List<Food> foods;
// //
// //   Jawad({
// //     required this.foods,
// //   });
// //
// //   factory Jawad.fromJson(Map<String, dynamic> json) => Jawad(
// //     foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
// //   };
// // }
// //
// // class Food {
// //   String category;
// //   String description;
// //   int id;
// //   String ingredients;
// //   String picture;
// //   String title;
// //
// //   Food({
// //     required this.category,
// //     required this.description,
// //     required this.id,
// //     required this.ingredients,
// //     required this.picture,
// //     required this.title,
// //   });
// //
// //   factory Food.fromJson(Map<String, dynamic> json) => Food(
// //     category: json["category"],
// //     description: json["description"],
// //     id: json["id"],
// //     ingredients: json["ingredients"],
// //     picture: json["picture"],
// //     title: json["title"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "category": category,
// //     "description": description,
// //     "id": id,
// //     "ingredients": ingredients,
// //     "picture": picture,
// //     "title": title,
// //   };
// // }
// // To parse this JSON data, do
// //
// //     final jawad = jawadFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// Jawad jawadFromJson(String str) => Jawad.fromJson(json.decode(str));
//
// String jawadToJson(Jawad data) => json.encode(data.toJson());
//
// class Jawad {
//   Foods foods;
//
//   Jawad({
//     required this.foods,
//   });
//
//   factory Jawad.fromJson(Map<String, dynamic> json) => Jawad(
//     foods: Foods.fromJson(json["foods"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "foods": foods.toJson(),
//   };
// }
//
// class Foods {
//   List<Africanfood> arabicfoods;
//   List<Africanfood> africanfoods;
//   List<Africanfood> europeanfoods;
//   List<Africanfood> americanfoods;
//   List<Africanfood> asianfoods;
//   List<Africanfood> sweets;
//   List<Africanfood> sauces;
//   List<Africanfood> salades;
//   List<Africanfood> juices;
//   List<Africanfood> iceCream;
//
//   Foods({
//     required this.arabicfoods,
//     required this.africanfoods,
//     required this.europeanfoods,
//     required this.americanfoods,
//     required this.asianfoods,
//     required this.sweets,
//     required this.sauces,
//     required this.salades,
//     required this.juices,
//     required this.iceCream,
//   });
//
//   factory Foods.fromJson(Map<String, dynamic> json) => Foods(
//     arabicfoods: List<Africanfood>.from(json["arabicfoods"].map((x) => Africanfood.fromJson(x))),
//     africanfoods: List<Africanfood>.from(json["africanfoods"].map((x) => Africanfood.fromJson(x))),
//     europeanfoods: List<Africanfood>.from(json["europeanfoods"].map((x) => Africanfood.fromJson(x))),
//     americanfoods: List<Africanfood>.from(json["americanfoods"].map((x) => Africanfood.fromJson(x))),
//     asianfoods: List<Africanfood>.from(json["asianfoods"].map((x) => Africanfood.fromJson(x))),
//     sweets: List<Africanfood>.from(json["sweets"].map((x) => Africanfood.fromJson(x))),
//     sauces: List<Africanfood>.from(json["sauces"].map((x) => Africanfood.fromJson(x))),
//     salades: List<Africanfood>.from(json["salades"].map((x) => Africanfood.fromJson(x))),
//     juices: List<Africanfood>.from(json["juices"].map((x) => Africanfood.fromJson(x))),
//     iceCream: List<Africanfood>.from(json["ice_cream"].map((x) => Africanfood.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "arabicfoods": List<dynamic>.from(arabicfoods.map((x) => x.toJson())),
//     "africanfoods": List<dynamic>.from(africanfoods.map((x) => x.toJson())),
//     "europeanfoods": List<dynamic>.from(europeanfoods.map((x) => x.toJson())),
//     "americanfoods": List<dynamic>.from(americanfoods.map((x) => x.toJson())),
//     "asianfoods": List<dynamic>.from(asianfoods.map((x) => x.toJson())),
//     "sweets": List<dynamic>.from(sweets.map((x) => x.toJson())),
//     "sauces": List<dynamic>.from(sauces.map((x) => x.toJson())),
//     "salades": List<dynamic>.from(salades.map((x) => x.toJson())),
//     "juices": List<dynamic>.from(juices.map((x) => x.toJson())),
//     "ice_cream": List<dynamic>.from(iceCream.map((x) => x.toJson())),
//   };
// }
//
// class Africanfood {
//   int id;
//   String title;
//   String description;
//   String picture;
//   String ingredients;
//
//   Africanfood({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.picture,
//     required this.ingredients,
//   });
//
//   factory Africanfood.fromJson(Map<String, dynamic> json) => Africanfood(
//     id: json["id"],
//     title: json["title"],
//     description: json["description"],
//     picture: json["picture"],
//     ingredients: json["ingredients"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "description": description,
//     "picture": picture,
//     "ingredients": ingredients,
//   };
//
//
// }
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map,this.reverseMap);
//
//   Map<T, String> get reverse {
//     reverseMap ??= map.map((k, v) => new MapEntry(v, k));
//     return reverseMap;
//   }
//
// }

// To parse this JSON data, do
//
//     final jawad = jawadFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Jawad jawadFromJson(String str) => Jawad.fromJson(json.decode(str));

String jawadToJson(Jawad data) => json.encode(data.toJson());

class Jawad {
  Foods foods;

  Jawad({
    required this.foods,
  });

  factory Jawad.fromJson(Map<String, dynamic> json) => Jawad(
    foods: Foods.fromJson(json["foods"]),
  );

  Map<String, dynamic> toJson() => {
    "foods": foods.toJson(),
  };
}

class Foods {
  List<Africanfood> africanfoods;
  List<Africanfood> americanfoods;
  List<Africanfood> arabicfoods;
  List<Africanfood> asianfoods;
  List<Africanfood> europeanfoods;
  List<Africanfood> iceCream;
  List<Africanfood> juices;
  List<Africanfood> salades;
  List<Africanfood> sauces;
  List<Africanfood> sweets;

  Foods({
    required this.africanfoods,
    required this.americanfoods,
    required this.arabicfoods,
    required this.asianfoods,
    required this.europeanfoods,
    required this.iceCream,
    required this.juices,
    required this.salades,
    required this.sauces,
    required this.sweets,
  });

  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
    africanfoods: List<Africanfood>.from(json["africanfoods"].map((x) => Africanfood.fromJson(x))),
    americanfoods: List<Africanfood>.from(json["americanfoods"].map((x) => Africanfood.fromJson(x))),
    arabicfoods: List<Africanfood>.from(json["arabicfoods"].map((x) => Africanfood.fromJson(x))),
    asianfoods: List<Africanfood>.from(json["asianfoods"].map((x) => Africanfood.fromJson(x))),
    europeanfoods: List<Africanfood>.from(json["europeanfoods"].map((x) => Africanfood.fromJson(x))),
    iceCream: List<Africanfood>.from(json["ice_cream"].map((x) => Africanfood.fromJson(x))),
    juices: List<Africanfood>.from(json["juices"].map((x) => Africanfood.fromJson(x))),
    salades: List<Africanfood>.from(json["salades"].map((x) => Africanfood.fromJson(x))),
    sauces: List<Africanfood>.from(json["sauces"].map((x) => Africanfood.fromJson(x))),
    sweets: List<Africanfood>.from(json["sweets"].map((x) => Africanfood.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "africanfoods": List<dynamic>.from(africanfoods.map((x) => x.toJson())),
    "americanfoods": List<dynamic>.from(americanfoods.map((x) => x.toJson())),
    "arabicfoods": List<dynamic>.from(arabicfoods.map((x) => x.toJson())),
    "asianfoods": List<dynamic>.from(asianfoods.map((x) => x.toJson())),
    "europeanfoods": List<dynamic>.from(europeanfoods.map((x) => x.toJson())),
    "ice_cream": List<dynamic>.from(iceCream.map((x) => x.toJson())),
    "juices": List<dynamic>.from(juices.map((x) => x.toJson())),
    "salades": List<dynamic>.from(salades.map((x) => x.toJson())),
    "sauces": List<dynamic>.from(sauces.map((x) => x.toJson())),
    "sweets": List<dynamic>.from(sweets.map((x) => x.toJson())),
  };
}

class Africanfood {
  String description;
  String ingredients;
  String picture;
  String title;

  Africanfood({
    required this.description,
    required this.ingredients,
    required this.picture,
    required this.title,
  });

  factory Africanfood.fromJson(Map<String, dynamic> json) => Africanfood(
    description: json["description"],
    ingredients: json["ingredients"],
    picture: json["picture"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "ingredients": ingredients,
    "picture": picture,
    "title": title,
  };
}
