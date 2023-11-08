class FoodScreen {
  List<Data>? data;

  FoodScreen({this.data});

  FoodScreen.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? idAset;
  String? namaAset;
  String? alamatAset;
  int? tipe;
  int? harga;
  String? gambar;
  int? kategoris;
  Null? createdAt;
  Null? updatedAt;

  Data(
      {this.idAset,
        this.namaAset,
        this.alamatAset,
        this.tipe,
        this.harga,
        this.gambar,
        this.kategoris,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    idAset = json['idAset'];
    namaAset = json['nama_aset'];
    alamatAset = json['alamat_aset'];
    tipe = json['tipe'];
    harga = json['harga'];
    gambar = json['gambar'];
    kategoris = json['kategoris'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idAset'] = this.idAset;
    data['nama_aset'] = this.namaAset;
    data['alamat_aset'] = this.alamatAset;
    data['tipe'] = this.tipe;
    data['harga'] = this.harga;
    data['gambar'] = this.gambar;
    data['kategoris'] = this.kategoris;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
