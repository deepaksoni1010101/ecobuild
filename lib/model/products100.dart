// // To parse this JSON data, do
// //
// //     final ProductApi = ProductApiFromJson(jsonString);
// import 'package:http/http.dart' as http;

// import 'dart:convert';

// import 'package:flutter/services.dart';

// List<ProductApi> ProductApiFromJson(String str) =>
//     List<ProductApi>.from(json.decode(str).map((x) => ProductApi.fromJson(x)));

// String ProductApiToJson(List<ProductApi> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ProductApi {
//   ProductApi({
//     required this.products,
//     required this.total,
//     required this.skip,
//     required this.limit,
//   });

//   List<Product> products;
//   int total;
//   int skip;
//   int limit;

//   factory ProductApi.fromJson(Map<String, dynamic> json) => ProductApi(
//         products: List<Product>.from(
//             json["products"].map((x) => Product.fromJson(x))),
//         total: json["total"],
//         skip: json["skip"],
//         limit: json["limit"],
//       );

//   Map<String, dynamic> toJson() => {
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//         "total": total,
//         "skip": skip,
//         "limit": limit,
//       };
// }

// class Product {
//   Product({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.discountPercentage,
//     required this.rating,
//     required this.stock,
//     required this.brand,
//     required this.category,
//     required this.thumbnail,
//     required this.images,
//   });

//   int id;
//   String title;
//   String description;
//   int price;
//   double discountPercentage;
//   double rating;
//   int stock;
//   String brand;
//   String category;
//   String thumbnail;
//   List<String> images;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         price: json["price"],
//         discountPercentage: json["discountPercentage"].toDouble(),
//         rating: json["rating"].toDouble(),
//         stock: json["stock"],
//         brand: json["brand"],
//         category: json["category"],
//         thumbnail: json["thumbnail"],
//         images: List<String>.from(json["images"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "price": price,
//         "discountPercentage": discountPercentage,
//         "rating": rating,
//         "stock": stock,
//         "brand": brand,
//         "category": category,
//         "thumbnail": thumbnail,
//         "images": List<dynamic>.from(images.map((x) => x)),
//       };
// }

// Future<List<ProductApi>> getData() async {
//   List<ProductApi> cData = [];

//   final response = await rootBundle.loadString("jsondata\json1.json");
//   if (response.statusCode == 200) {
//     print('Responce Data ${response.body}');
//     // List rData = jsonDecode(response.body);
//     // rData.forEach((element) {
//     //   ProductApi obj = ProductApi.fromJson(element);
//     //   cData.add(obj);
//     // });

//     Map<String, dynamic> rData = jsonDecode(response.body);
//     print(rData);
//     ProductApi obj = ProductApi.fromJson(rData);
//     cData.add(obj);
//     print(cData[0].brand);
//     return cData;
//   } else {
//     print("Failed");
//     return cData;
//   }
// }
