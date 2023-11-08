// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_icon.dart';
// import 'package:flutter_japanese_restaurant_app/src/model/model_aset.dart';
// import 'package:flutter_japanese_restaurant_app/src/model/food_category.dart';
// import 'package:flutter_japanese_restaurant_app/src/model/bottom_navigation_item.dart';
// import 'package:http/http.dart' as http;
//
//
// class AppData {
//   const AppData._();
//
//   static List<BottomNavigationItem> bottomNavigationItems = [
//     BottomNavigationItem(
//       const Icon(Icons.home_outlined),
//       const Icon(Icons.home),
//       'Beranda',
//       isSelected: true,
//     ),
//     BottomNavigationItem(
//       const Icon(Icons.shopping_cart_outlined),
//       const Icon(Icons.shopping_cart),
//       'Riwayat',
//     ),
//     BottomNavigationItem(
//       const Icon(AppIcon.outlinedHeart),
//       const Icon(AppIcon.heart),
//       'Favorit',
//     ),
//     BottomNavigationItem(
//       const Icon(Icons.person_outline),
//       const Icon(Icons.person),
//       'Akun',
//     )
//   ];
//
//   static List<FoodCategory> categories = [
//     FoodCategory(FoodType.Semua, true),
//     FoodCategory(FoodType.Rumah, false),
//     FoodCategory(FoodType.Lapangan, false),
//     FoodCategory(FoodType.Gedung, false),
//     FoodCategory(FoodType.Kantor, false),
//   ];
// }
//
//
