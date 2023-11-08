enum FoodType { Semua, Rumah, Gedung, Kantor, Lapangan }


class Productse {
  int? idAset;
  String? namaAset;
  String? alamatAset;
  int? tipe;
  int? harga;
  String? createdAt;
  String? updatedAt;
  String? gambar;
  int? kategori;
  bool? isLiked;

  Productse(
      {this.idAset,
        this.namaAset,
        this.alamatAset,
        this.tipe,
        this.harga,
        this.createdAt,
        this.updatedAt,
        this.gambar,
        this.kategori,
        this.isLiked});

  Productse.fromJson(Map<String, dynamic> json) {
    idAset = json['idAset'];
    namaAset = json['nama_aset'];
    alamatAset = json['alamat_aset'];
    tipe = json['tipe'];
    harga = json['harga'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gambar = json['gambar'];
    kategori = json['kategori'];
    isLiked = json['is_liked'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idAset'] = this.idAset;
    data['nama_aset'] = this.namaAset;
    data['alamat_aset'] = this.alamatAset;
    data['tipe'] = this.tipe;
    data['harga'] = this.harga;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['gambar'] = this.gambar;
    data['kategori'] = this.kategori;
    data['is_liked'] = this.isLiked;
    return data;
  }


}
