import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

// ProductApi productApiFromJson(String str) =>
//     ProductApi.fromJson(json.decode(str));

// String productApiToJson(ProductApi data) => json.encode(data.toJson());
// List<ProductApi> cData = [];

class ProductApi {
  ProductApi({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
  });

  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;

  factory ProductApi.fromJson(Map<String, dynamic> json) => ProductApi(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
      };
}

// Future<List<ProductApi>>
getData() async {
  List<ProductApi> cData = [];

  final json = await rootBundle.loadString("lib/jsondata/json1.json");

  final response =
      await http.get(Uri.parse("https://dummyjson.com/products/1"));
  if (response.statusCode == 200) {
    print('Responce Data ${response.body}');
    // List rData = jsonDecode(response.body);
    // rData.forEach((element) {
    //   ProductApi obj = ProductApi.fromJson(element);
    //   cData.add(obj);
    // });
    List rData = jsonDecode(json);

    rData.forEach((element) {
      ProductApi obj = ProductApi.fromJson(element);
      cData.add(obj);
    });
    return cData;
  } else {
    print("Failed");
    return cData;
  }
}
