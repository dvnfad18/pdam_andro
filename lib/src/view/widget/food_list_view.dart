// import 'package:flutter_japanese_restaurant_app/API/Api_service.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_style.dart';
// import 'package:flutter_japanese_restaurant_app/src/model/model_aset.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
// import 'package:flutter_japanese_restaurant_app/src/controller/food_controller.dart';
// import 'package:flutter_japanese_restaurant_app/src/view/screen/food_detail_screen.dart';
// import 'package:flutter_japanese_restaurant_app/src/view/widget/custom_page_route.dart';
// import 'package:flutter_japanese_restaurant_app/src/view/screen/food_list_screen.dart';
// import '../../model/FoodDetailScreen.dart';
//
//
// class Product {
//   final String title;
//
//   Product(this.title);
// }
//
// class FoodListView extends StatefulWidget {
//   // const FoodListView({super.key});
//
//   const FoodListView({
//     Key? key,
//     required this.foods,
//     this.isReversedList = false,
//   }) : super(key: key);
//
//   final List<Food> foods;
//   final bool isReversedList;
//
//
//   @override
//   State<FoodListView> createState() => _FoodListViewState();
// }
//
// class _FoodListViewState extends State<FoodListView> {
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: ListView.separated(
//         padding: const EdgeInsets.only(top: 20, left: 10),
//         scrollDirection: Axis.horizontal,
//         itemCount: widget.isReversedList ? 3 : widget.foods.length,
//         itemBuilder: (_, index) {
//           Food food =
//               widget.isReversedList ? widget.foods.reversed.toList()[index] : widget.foods[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 CustomPageRoute(child: FoodDetailScreen(food: food)),
//               );
//             },
//             child: Container(
//               width: 160,
//               padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                 color: controller.isLightTheme
//                     ? Colors.white
//                     : DarkThemeColor.primaryLight,
//                 borderRadius: const BorderRadius.all(Radius.circular(20)),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.asset(Data.gambar, scale: 6),
//                     Text(
//                       "\$${data.harga.length}",
//                       style: h3Style.copyWith(color: LightThemeColor.accent),
//                     ),
//                     Text(
//                       data.namaAset,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineMedium
//                           ?.copyWith(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ).fadeAnimation(0.7),
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (_, __) {
//           return const Padding(padding: EdgeInsets.only(right: 50));
//         },
//       ),
//     );
//   }
// }
