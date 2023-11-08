// import 'package:get/get.dart';
// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart' hide Badge;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_data.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
// import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
// import 'package:flutter_japanese_restaurant_app/src/model/model_aset.dart';
// import 'package:flutter_japanese_restaurant_app/src/controller/food_controller.dart';
// import 'package:flutter_japanese_restaurant_app/src/view/widget/food_list_view.dart';
// import 'package:flutter_japanese_restaurant_app/API/Api_connect.dart';
// import 'package:flutter_japanese_restaurant_app/src/model/food_category.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../model/FoodDetailScreen.dart';
//
// final FoodController controller = Get.put(FoodController());
//
// class FoodListScreen extends StatefulWidget {
//   const FoodListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FoodListScreen> createState() => _FoodListScreenState();
// }
// Future<List<Data>> fetchDataFromDatabase() async {
//   final response = await http.get(Uri.parse(ApiConnect.app_asset));
//
//   if (response.statusCode == 200) {
//     List<dynamic> jsonData = jsonDecode(response.body);
//     List<Food> foods = jsonData.map((item) => Food.fromJson(item)).toList();
//
//     // Mengonversi List<Food> ke List<Data>
//     List<Data> dataList = foods.map((food) => Data.fromJson(food.toJson())).toList();
//
//     return dataList;
//   } else {
//     throw Exception('Failed to load data from the database');
//   }
// }
//
// class _FoodListScreenState extends State<FoodListScreen> {
//   Food convertDataToFood(Data data) {
//     return Food(
//       idAset: data.idAset,
//       namaAset: data.namaAset,
//       alamatAset: data.alamatAset,
//       tipe: data.tipe,
//       harga: data.harga,
//       gambar: data.gambar,
//       kategoris: data.kategoris,
//     );
//   }
//   late Future<List<Data>> data;
//   @override
//   void initState() {
//     super.initState();
//     data = fetchDataFromDatabase();
//   }
//
//   PreferredSizeWidget _appBar(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         icon: const FaIcon(FontAwesomeIcons.dice),
//         onPressed: controller.changeTheme,
//       ),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.location_on_outlined, color: LightThemeColor.accent),
//             Text("Lokasi", style: Theme.of(context).textTheme.bodyLarge)
//         ],
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: Badge(
//             badgeStyle: const BadgeStyle(badgeColor: LightThemeColor.accent),
//             badgeContent: const Text(
//               "2",
//               style: TextStyle(color: Colors.white),
//             ),
//             position: BadgePosition.topStart(start: -3),
//             child: const Icon(Icons.notifications_none, size: 30),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _searchBar() {
//     return const Padding(
//       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: 'Cari Sewa',
//           prefixIcon: Icon(Icons.search, color: Colors.grey),
//           contentPadding: EdgeInsets.all(20),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appBar(context),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Selamat Datang \nSobat PDAM Surya Sembada",
//                 style: Theme.of(context).textTheme.headlineSmall,
//               ).fadeAnimation(0.2),
//               Text(
//                 "Apa yang ingin Anda sewa?",
//                 style: Theme.of(context).textTheme.displayLarge,
//               ).fadeAnimation(0.4),
//               _searchBar(),
//               Text(
//                 "Ada Untuk Anda",
//                 style: Theme.of(context).textTheme.displaySmall,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: SizedBox(
//                   height: 40,
//                   child: GetBuilder(
//                     builder: (FoodController controller) {
//                       return ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: AppData.categories.length,
//                         itemBuilder: (_, index) {
//                           FoodCategory category = AppData.categories[index];
//                           return GestureDetector(
//                             onTap: () {
//                               controller.filterItemByCategory(category);
//                             },
//                             child: Container(
//                               width: 100,
//                               alignment: Alignment.center,
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: category.isSelected
//                                     ? LightThemeColor.accent
//                                     : Colors.transparent,
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(15),
//                                 ),
//                               ),
//                               child: Text(
//                                 category.kategori.name.toCapital,
//                                 style:
//                                     Theme.of(context).textTheme.headlineMedium,
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (_, __) {
//                           return const Padding(
//                             padding: EdgeInsets.only(right: 15),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               GetBuilder(
//                 builder: (FoodController controller) {
//                   return FoodListView(foods: controller.filteredFoods);
//                 },
//               ),
//               FutureBuilder<List<Data>>(
//                 future: data,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No data available'));
//                   } else {
//                     List<Data> dataList = snapshot.data!;
//                     List<Food> foodList = dataList.map<Food>((data) => convertDataToFood(data)).toList();
//                     return FoodListView(foods: foodList, isReversedList: true);
//                   return ListView.builder(
//                       itemCount: dataList.length,
//                       itemBuilder: (context, index) {
//                         Data data = dataList[index];
//                         return ListTile(
//                           title: Text(data.namaAset ?? ''),
//                           subtitle: Text(data.alamatAset ?? ''),
//                           // Tambahkan elemen UI lainnya sesuai dengan kebutuhan Anda
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 25, bottom: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Terbaik Untuk Anda",
//                       style: Theme.of(context).textTheme.displaySmall,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Text(
//                         "Lihat Semua",
//                         style: Theme.of(context)
//                             .textTheme
//                             .headlineMedium
//                             ?.copyWith(color: LightThemeColor.accent),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
