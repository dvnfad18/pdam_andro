import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/core/app_icon.dart';
import 'package:flutter_japanese_restaurant_app/core/app_asset.dart';
import 'package:flutter_japanese_restaurant_app/src/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/model/food_category.dart';
import 'package:flutter_japanese_restaurant_app/src/model/bottom_navigation_item.dart';

class AppData {
  const AppData._();

  static const dummyText =
      "produk ......";

  static List<Food> foodItems = [
    Food(
      AppAsset.sushi1,
      "Rumah Dinas A1",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      FoodType.Rumah,
      150,
    ),
    Food(
      AppAsset.sushi2,
      "Lapangan Badminton",
      15.0,
      1,
      false,
      dummyText,
      3.5,
      FoodType.Lapangan,
      652,
    ),
    Food(
      AppAsset.sushi3,
      "Rumah Dinas B4",
      20.0,
      1,
      false,
      dummyText,
      4.0,
      FoodType.Rumah,
      723,
    ),
    Food(
      AppAsset.sushi4,
      "Invention Hall",
      40.0,
      1,
      false,
      dummyText,
      2.5,
      FoodType.Gedung,
      456,
    ),
    Food(
      AppAsset.sushi5,
      "Working Space",
      10.0,
      1,
      false,
      dummyText,
      4.5,
      FoodType.Gedung,
      650,
    ),
    Food(
      AppAsset.sushi6,
      "Kantor Bank A1",
      20.0,
      1,
      false,
      dummyText,
      1.5,
      FoodType.Kantor
      ,
      350,
    ),
    Food(
      AppAsset.sushi7,
      "Kantor Bank A2",
      12.0,
      1,
      false,
      dummyText,
      3.5,
      FoodType.Kantor
      ,
      265,
    ),
    Food(
      AppAsset.sushi8,
      "Lapangan Voli",
      30.0,
      1,
      false,
      dummyText,
      4.0,
      FoodType.Lapangan,
      890,
    ),
    Food(
      AppAsset.sushi9,
      "Rumah Dinas B2",
      10.0,
      1,
      false,
      dummyText,
      5.0,
      FoodType.Rumah,
      900,
    ),
    Food(
      AppAsset.sushi10,
      "Lapangan Tenis",
      15.0,
      1,
      false,
      dummyText,
      3.5,
      FoodType.Lapangan,
      420,
    ),
    Food(
      AppAsset.sushi11,
      "Lapangan Futsal",
      25.0,
      1,
      false,
      dummyText,
      3.0,
      FoodType.Lapangan,
      263,
    ),
    Food(
      AppAsset.sushi12,
      "Rumah Dinas B6",
      20.0,
      1,
      false,
      dummyText,
      5.0,
      FoodType.Rumah,
      560,
    ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
      const Icon(Icons.home_outlined),
      const Icon(Icons.home),
      'Beranda',
      isSelected: true,
    ),
    BottomNavigationItem(
      const Icon(Icons.shopping_cart_outlined),
      const Icon(Icons.shopping_cart),
      'Riwayat',
    ),
    BottomNavigationItem(
      const Icon(AppIcon.outlinedHeart),
      const Icon(AppIcon.heart),
      'Favorit',
    ),
    BottomNavigationItem(
      const Icon(Icons.person_outline),
      const Icon(Icons.person),
      'Akun',
    )
  ];

  static List<FoodCategory> categories = [
    FoodCategory(FoodType.Semua, true),
    FoodCategory(FoodType.Rumah, false),
    FoodCategory(FoodType.Lapangan, false),
    FoodCategory(FoodType.Gedung, false),
    FoodCategory(FoodType.Kantor, false),
  ];
}
