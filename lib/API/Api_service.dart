import 'dart:convert';
import 'package:http/http.dart' as http;
import '../src/model/GetKategori.dart';
import '../src/model/model_aset.dart';
import 'package:flutter_japanese_restaurant_app/API/Api_connect.dart';
import 'package:flutter_japanese_restaurant_app/SessionManager.dart';
import 'package:flutter_japanese_restaurant_app/src/model/model_favorit.dart';
//
// import 'package:ecommerce_ui/models/GetTransaksi_model.dart';
// import 'package:ecommerce_ui/models/Total.dart';
// import 'package:ecommerce_ui/models/getdataKeranjang.dart';
// import 'package:ecommerce_ui/models/payment.dart';

class ServiceApiAset {
  late SessionManager _sessionManager;

  Future<List<Productse>> getData() async {
    _sessionManager = SessionManager();
    try {
      var idCust = await SessionManager.getIdCust();
      var idCustString = idCust?.toString() ?? '';
      final response = await http.post(Uri.parse(ApiConnect.app_asset), body: {
        'idCust': idCustString
      });
      // Cetak respons API sebelum pengolahan
      print('Respons API sebelum pengolahan: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> jsonData = await fetchData(response.body);
        List<Productse> data = jsonData.map((e) => Productse.fromJson(e)).toList();
        // Cetak respons API setelah pengolahan
        print('Respons API setelah pengolahan: $jsonData');
        return data;
      } else {
        throw Exception('Gagal mengambil data produk. Status kode: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
      throw Exception('Terjadi kesalahan saat mengambil data produk. Periksa koneksi internet Anda dan coba lagi.');
    }
  }

  Future<List<dynamic>> fetchData(String responseBody) async {
    final dynamic parsedResponse = json.decode(responseBody);
    if (parsedResponse is List) {
      // Jika respons adalah List, gunakan langsung
      return parsedResponse;
    } else if (parsedResponse is Map) {
      // Jika respons adalah objek, ubahnya ke dalam List
      return [parsedResponse];
    } else {
      // Jika respons adalah objek tunggal, ubahnya ke dalam List
      return [parsedResponse];
    }
  }

}


class ServiceApiFavorit {
  late SessionManager _sessionManager;

  Future<List<GetDataFav>> getData() async {
    _sessionManager = SessionManager();
    try {
      var idCust = await SessionManager.getIdCust();
      var idCustString = idCust?.toString() ?? '';
      final response = await http.post(Uri.parse(ApiConnect.favorit), body: {
        'idCust': idCustString
      });
      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonData = jsonDecode(response.body);
        List<GetDataFav> data =
        jsonData.map((e) => GetDataFav.fromJson(e)).toList();
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
// class TotalService{
//   late SessionManager _sessionManager;
//
//   Future<Total> getTotalJumlah() async {
//     try {
//       var idCustomer = await SessionManager.getIdCustomer();
//       var idCustomerString = idCustomer?.toString() ?? '';
//       final response = await http.post(Uri.parse(ApiConnect.total), body: {
//         'id_customer': idCustomerString
//       });
//       if (response.statusCode == 200) {
//         print(response.body);
//         final jsonData = jsonDecode(response.body);
//         final total = Total.fromJson(jsonData);
//         return total;
//       } else {
//         throw Exception('Failed to load total jumlah');
//       }
//     } catch (e) {
//       print(e.toString());
//       throw Exception('Failed to load total jumlah');
//     }
//   }
//
// }



// class ServiceApiKeranjang {
//   late SessionManager _sessionManager;
//
//   Future<List<GetKeranjang>> getData() async {
//     _sessionManager = SessionManager();
//     try {
//       var idCustomer = await SessionManager.getIdCustomer();
//       var idCustomerString = idCustomer?.toString() ?? '';
//       final response = await http.post(Uri.parse(ApiConnect.keranjang), body: {
//         'id_customer': idCustomerString
//       });
//       if (response.statusCode == 200) {
//         print(response.body);
//         print(idCustomer);
//         List<dynamic> jsonData = jsonDecode(response.body);
//         List<GetKeranjang> data =
//         jsonData.map((e) => GetKeranjang.fromJson(e)).toList();
//         return data;
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print(e.toString());
//       throw Exception('Failed to load data');
//     }
//   }
// }
// class ServiceApiPaymen {
//   Future<List<Paymen>> getData() async {
//
//     try {
//
//       final response = await http.post(Uri.parse(ApiConnect.paymen));
//       if (response.statusCode == 200) {
//         print(response.body);
//         List<dynamic> jsonData = jsonDecode(response.body);
//         List<Paymen> data =
//         jsonData.map((e) => Paymen.fromJson(e)).toList();
//         return data;
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print(e.toString());
//       throw Exception('Failed to load data');
//     }
//   }
// }

class ServiceApiKategori {
  Future<List<Kategori>> getData() async {

    try {

      final response = await http.post(Uri.parse(ApiConnect.kategori));
      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Kategori> data =
        jsonData.map((e) => Kategori.fromJson(e)).toList();
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
//
// class ServiceApiGetTrans {
//   late SessionManager _sessionManager;
//
//   Future<List<GetTransaksi>> getData() async {
//     _sessionManager = SessionManager();
//     try {
//       var idCustomer = await SessionManager.getIdCustomer();
//       var idCustomerString = idCustomer?.toString() ?? '';
//       final response = await http.post(Uri.parse(ApiConnect.getjual), body: {
//         'id_customer': idCustomerString
//       });
//       if (response.statusCode == 200) {
//         print(response.body);
//         List<dynamic> jsonData = jsonDecode(response.body);
//         List<GetTransaksi> data =
//         jsonData.map((e) => GetTransaksi.fromJson(e)).toList();
//         return data;
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print(e.toString());
//       throw Exception('Failed to load data');
//     }
//   }
// }


class LapanganService {
  static Future<dynamic> show(int id) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/'),
        body: {
          'id': id.toString()
        }, // Convert id to String before sending it in the request body
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final success = data['success'];
        final message = data['message'];
        final lapanganData = data['data'];

        if (success) {
          return lapanganData;
        } else {
          throw Exception('Data Post Tidak Ditemukan!');
        }
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (error) {
      throw Exception('Terjadi kesalahan: $error');
    }
  }
}

class TransaksiSubmit {
  static Future<void> createTransaksi(
      Map<String, String> data, String imagePath) async {
    final apiUrl = 'http://127.0.0.1:8000/';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add form fields
      request.fields.addAll(data);

      // Add image file
      if (imagePath.isNotEmpty) {
        var image = await http.MultipartFile.fromPath('bukti_bayar', imagePath);
        request.files.add(image);
      }

      var response = await request.send();

      if (response.statusCode == 201) {
        final responseData = await response.stream.bytesToString();
        print(responseData);
      } else {
        print('Failed to create transaksi: ${response.statusCode}');
        throw Exception('Failed to create transaksi');
      }
    } catch (e) {
      print(data);
      print('$e');
      throw Exception('Failed to create transaksi');
    }
  }
}