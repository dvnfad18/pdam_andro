// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_icon.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
// import 'package:flutter_japanese_restaurant_app/src/model/model_aset.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
// import 'package:flutter_japanese_restaurant_app/src/view/widget/counter_button.dart';
// import 'package:flutter_japanese_restaurant_app/src/controller/food_controller.dart';
// import '../../model/FoodDetailScreen.dart';
//
// import 'package:flutter_japanese_restaurant_app/src/view/widget/scale_animation.dart';
//
// final FoodController controller = Get.put(FoodController());
//
//
// class Products {
//   final String title;
//   Products(this.title);
// }
//
// class FoodDetailScreen extends StatefulWidget {
//   const FoodDetailScreen({Key? key, required this.food}) : super(key: key);
//
//   final Food food;
//
//   @override
//   State<FoodDetailScreen> createState() => _FoodDetailScreenState();
// }
//
// class _FoodDetailScreenState extends State<FoodDetailScreen> {
//   List<dynamic> productse = [];
//
//   String userName = '';
//
//   PreferredSizeWidget _appBar(BuildContext context) {
//     return AppBar(
//       title: Text(
//         "Detail Sewa",
//         style: TextStyle(
//           color: controller.isLightTheme ? Colors.black : Colors.white,
//         ),
//       ),
//       leading: IconButton(
//         onPressed: () => Navigator.pop(context),
//         icon: const Icon(Icons.arrow_back),
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.more_vert),
//         )
//       ],
//     );
//   }
//
//   Widget fab(VoidCallback onPressed) {
//     return FloatingActionButton(
//       elevation: 0.0,
//       backgroundColor: LightThemeColor.accent,
//       onPressed: onPressed,
//       // child: widget.food.isFavorite
//       //     ? const Icon(AppIcon.heart)
//       //     : const Icon(AppIcon.outlinedHeart),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: _appBar(context),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//       floatingActionButton:
//           GetBuilder(builder: (FoodController foodController) {
//         return fab(() => foodController.isFavoriteFood(widget.food));
//       }),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.transparent,
//         child: SizedBox(
//           height: height * 0.5,
//           child: Container(
//             decoration: BoxDecoration(
//               color: controller.isLightTheme
//                   ? Colors.white
//                   : DarkThemeColor.primaryLight,
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(30),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         RatingBar.builder(
//                           itemPadding: EdgeInsets.zero,
//                           itemSize: 20,
//                           // initialRating: widget.food.score,
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           glow: false,
//                           ignoreGestures: true,
//                           itemBuilder: (_, __) => const FaIcon(
//                             FontAwesomeIcons.solidStar,
//                             color: LightThemeColor.yellow,
//                           ),
//                           onRatingUpdate: (rating) {},
//                         ),
//                         const SizedBox(width: 15),
//                         // Text(
//                         //   // widget.food.score.toString(),
//                         //   // style: Theme.of(context).textTheme.titleMedium,
//                         // ),
//                         // const SizedBox(width: 5),
//                         // Text(
//                         //   // "(${widget.food.})",
//                         //   style: Theme.of(context).textTheme.titleMedium,
//                         // )
//                       ],
//                     ).fadeAnimation(0.4),
//                     const SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "\$${widget.food.price}",
//                           style: Theme.of(context)
//                               .textTheme
//                               .displayLarge
//                               ?.copyWith(color: LightThemeColor.accent),
//                         ),
//                         GetBuilder(
//                           builder: (FoodController foodController) {
//                             return CounterButton(
//                               onIncrementSelected: () =>
//                                   foodController.increaseItem(widget.food),
//                               onDecrementSelected: () =>
//                                   foodController.decreaseItem(widget.food),
//                               label: Text(
//                                 widget.food.quantity.toString(),
//                                 style: Theme.of(context).textTheme.displayLarge,
//                               ),
//                             );
//                           },
//                         )
//                       ],
//                     ).fadeAnimation(0.6),
//                     const SizedBox(height: 15),
//                     Text(
//                       "Deskripsi",
//                       style: Theme.of(context).textTheme.displayMedium,
//                     ).fadeAnimation(0.8),
//                     const SizedBox(height: 15),
//                     // Text(
//                     //   products != null ? products['nama_aset'] : 'Nama Aset Tidak Ditemukan',
//                     //   style: Theme.of(context).textTheme.titleMedium,
//                     // ).fadeAnimation(0.8),
//                     const SizedBox(height: 30),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 45,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: width * 0.1),
//                         child: ElevatedButton(
//                           onPressed: () => controller.addToCart(widget.food),
//                           child: const Text("Ajukan Sewa"),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: ScaleAnimation(
//         child: Center(child: Image.asset(widget.food.gambar, scale: 2)),
//       ),
//     );
//   }
// }
//
//
//
