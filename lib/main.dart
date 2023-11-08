import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:flutter_japanese_restaurant_app/src/view/screen/Login/login_screen.dart';
import 'package:flutter_japanese_restaurant_app/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PDAM Surya Sembada',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: kPrimaryColor,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryLightColor,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),

      home: const LoginScreen(),


    );
  }
}


// final FoodController controller = Get.put(FoodController());
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'PDAM_ASSETS',
//       theme: ThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white,
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             elevation: 0,
//             primary: kPrimaryColor,
//             shape: const StadiumBorder(),
//             maximumSize: const Size(double.infinity, 56),
//             minimumSize: const Size(double.infinity, 56),
//           ),
//         ),
//         inputDecorationTheme: const InputDecorationTheme(
//           filled: true,
//           fillColor: kPrimaryLightColor,
//           iconColor: kPrimaryColor,
//           prefixIconColor: kPrimaryColor,
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: defaultPadding, vertical: defaultPadding),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(30)),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//
//       home: HomeScreen(),

//
//     );
//   }
// }

// final FoodController controller = Get.put(FoodController());
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         scrollBehavior: const MaterialScrollBehavior().copyWith(
//           dragDevices: {
//             PointerDeviceKind.mouse,
//             PointerDeviceKind.touch,
//           },
//         ),
//         theme: controller.theme.value,
//         home: const LoginScreen(),
//       );
//     });
//   }
// }