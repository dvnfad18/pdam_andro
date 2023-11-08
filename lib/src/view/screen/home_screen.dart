import 'package:flutter_japanese_restaurant_app/src/view/screen/Akun/Akun_body.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/peminjaman.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/Akun/Akun_pic.dart';
import 'package:flutter_japanese_restaurant_app/API/Api_service.dart';
import 'package:flutter_japanese_restaurant_app/src/model/model_aset.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_japanese_restaurant_app/constants.dart';
import 'package:flutter_japanese_restaurant_app/src/model/model_user.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/favorit.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/productsr.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/products.dart';
import 'package:flutter_japanese_restaurant_app/src/model/model_favorit.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/peminjaman.dart';

// import 'package:ecommerce_ui/models/GetTransaksi_model.dart';
// import 'package:ecommerce_ui/screens/home_screen/components/coba.dart';
// import '../checkout_screen/checkout_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  int _currentIndex = 0;
  List<GetDataFav> favorites = [];
  List<Widget> _fragments = [
    FragmentBeranda(),
    // const FragmentProduk(),
    FavoriteScreens(
      favorites: [],
    ),
    FragmentAkun(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fragments[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // if (index == 2) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (_) => FavoriteScreens(favorites: favorites),
          //     ),
          //   );
          // }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blueAccent),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.blueAccent),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.blueAccent),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.blueAccent),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

class FragmentBeranda extends StatefulWidget {
  FragmentBeranda({Key? key}) : super(key: key);
  @override
  _FragmentBerandaState createState() => _FragmentBerandaState();
}

class _FragmentBerandaState extends State<FragmentBeranda> {
  List<Productse> data = []; // Variabel untuk menyimpan data produk
  List<Productse> searchResults = []; // State untuk menampung hasil pencarian
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    List<Productse> products = await ServiceApiAset().getData();
    setState(() {
      data = products;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void searchProducts(String keyword) {
    if (keyword.isEmpty) {
      setState(() {
        searchResults = [];
        isSearching = false;
      });
    } else {
      List<Productse> results = data.where((product) {
        return product.namaAset!
            .toLowerCase()
            .contains(keyword.toLowerCase());
      }).toList();

      results.sort((a, b) {
        int differenceA =
        (a.namaAset!.toLowerCase().length - keyword.length).abs();
        int differenceB =
        (b.namaAset!.toLowerCase().length - keyword.length).abs();

        return differenceA.compareTo(differenceB);
      });

      setState(() {
        searchResults = results;
        isSearching = true;
      });
    }
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(
          56), // Sesuaikan dengan ketinggian yang diinginkan
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 52, 12, 0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Tindakan yang dijalankan saat gambar di-tap
              },
              child: Image.asset(
                'assets/images/larikanan.png',
                width: 44, // Sesuaikan ukuran gambar
                height: 44,
              ),
            ),
            const SizedBox(width: 8),
            // const Text(
            //   'Selamat Datang di PDAM Surya Sembada',
            //   style: TextStyle(
            //     fontSize: 21,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PeminjamanPage(idCust: data.length),
                  ),
                );
              },
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return const Padding(
      padding: EdgeInsets.only(left: 24, right: 100),
      child: Text(
        'Selamat Datang di PDAM Surya Sembada',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 48,
        child: TextField(
          controller: searchController,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: kSecondaryColor,
              ),
            ),
            fillColor: Colors.white,
            hintText: 'Cari Produk Yang Anda Inginkan',
            prefixIcon: const Icon(FontAwesomeIcons.search),
          ),
          onChanged: searchProducts,
        ),
      ),
    );
  }

  Widget gass() {
    return FutureBuilder<List<Productse>>(
      future: ServiceApiAset().getData(),
      builder: (BuildContext context, AsyncSnapshot<List<Productse>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('No data available.'),
          );
        } else {
          List<Productse> data = snapshot.data!;
          return Expanded(
            child: isSearching && searchResults.isNotEmpty
                ? Products(
              title: 'Hasil Pencarian',
              data: searchResults,
            )
                : Products(
              title: 'Produk',
              data: data,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.white,
                Colors.white,
              ],
              stops: [0.0, 0.05, 1.0],
            ).createShader(bounds);
          },
          child: Column(
            children: [
              const SizedBox(height: 24),
              Expanded(
                child: isSearching && searchResults.isNotEmpty
                    ? Products(
                  title: 'Hasil Pencarian',
                  data: searchResults,
                )
                    : Products(
                  title: 'Produk',
                  data: data,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FragmentP extends StatelessWidget {
  const FragmentP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Productse>>(
        future: ServiceApiAset().getData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Productse>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No data available.'),
            );
          } else {
            List<Productse> data = snapshot.data!;
            return Productsr(
              title: 'Produk',
              data: data,
            );
          }
        },
      ),
    );
  }
}
//
// class FragmentProduk extends StatelessWidget {
//   const FragmentProduk({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<GetTransaksi>>(
//         future: ServiceApiGetTrans().getData(),
//         builder:
//             (BuildContext context, AsyncSnapshot<List<GetTransaksi>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//               child: Text('No data available.'),
//             );
//           } else {
//             List<GetTransaksi> data = snapshot.data!;
//             int index = 0;
//             return TrackingScreens(
//               title: 'Riwayat',
//               data: data,
//             );
//           }
//         },
//       ),
//     );
//   }
// }

class FavoriteScreens extends StatelessWidget {
  final List<GetDataFav> favorites;

  const FavoriteScreens({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<GetDataFav>>(
        future: ServiceApiFavorit().getData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GetDataFav>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No data available.'),
            );
          } else {
            List<GetDataFav> data = snapshot.data!;
            return ProductF(
              title: 'Produk',
              data: data,
            );
          }
        },
      ),
    );
  }
}

class FragmentAkun extends StatelessWidget {
  const FragmentAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Users>(
        future: ServiceApiProfil().getData(),
        builder: (BuildContext context, AsyncSnapshot<Users> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('No data available.'),
            );
          } else {
            Users data = snapshot.data!;
            return AkunPic();
          }
        },
      ),
    );
  }
}

// import 'package:flutter_japanese_restaurant_app/src/view/screen/cart_screen.dart';
// import 'package:flutter_japanese_restaurant_app/src/view/screen/profile_screen.dart';
// import 'package:flutter_japanese_restaurant_app/src/controller/food_controller.dart';
// import 'package:flutter_japanese_restaurant_app/src/view/screen/favorite_screen.dart';
// import 'package:flutter_japanese_restaurant_app/src/view/widget/page_transition.dart';
// import 'package:flutter_japanese_restaurant_app/src/view/screen/food_list_screen.dart';

// final FoodController controller = Get.put(FoodController());
//
// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);
//
//   final List<Widget> screen = [
//     const FoodListScreen(),
//     // const CartScreen(),
//     const FavoriteScreen(),
//     AkunScreen()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//             () => PageTransition(
//           child: screen[controller.currentBottomNavItemIndex.value],
//         ),
//       ),
//       bottomNavigationBar: Obx(() {
//         return BottomNavigationBar(
//           currentIndex: controller.currentBottomNavItemIndex.value,
//           onTap: controller.switchBetweenBottomNavigationItems,
//           selectedFontSize: 0,
//           items: AppData.bottomNavigationItems.map(
//                 (element) {
//               return BottomNavigationBarItem(
//                 icon: element.disableIcon ?? Icon(Icons.error), // Sertakan icon default jika null
//                 label: element.label,
//                 activeIcon: element.enableIcon ?? Icon(Icons.error), // Sertakan icon default jika null
//               );
//             },
//           ).toList(),
//         );
//       }),
//     );
//   }
// }



