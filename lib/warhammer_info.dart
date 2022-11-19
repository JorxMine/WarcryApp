import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:warcry_app/warhammer_mini.dart';
import 'warhammer_functions.dart';

var functions = Functions();
String file = 'assets/json/warcry_units.json';

// App Class

class Warhammer {
  late String name;
  late int cost;
  late String image;
  late int rating;

  Warhammer(this.name, this.cost, this.image, this.rating);

  Warhammer.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    cost = json["cost"];
    image = json["image"];
    rating = json["rating"];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'cost': cost,
        'image': image,
        'rating': rating,
      };
}

// App Functions

Future<List<Warhammer>> loadJsonData() async {
  var data = await rootBundle.rootBundle.loadString(file);
  var jsonDataLoaded = jsonDecode(data) as List<dynamic>;

  return jsonDataLoaded.map((e) => Warhammer.fromJson(e)).toList();
}
