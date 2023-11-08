class GetDataFav {
  int? idAset;
  String? nama_aset;
  int? jumlahAset;
  int? harga;
  String? deskripsi;
  String? gambar;
  int? idKategori;
  String? createdAt;
  String? updatedAt;
  bool? isLiked;

  GetDataFav(
      {this.idAset,
        this.nama_aset,
        this.jumlahAset,
        this.harga,
        this.deskripsi,
        this.gambar,
        this.idKategori,
        this.createdAt,
        this.updatedAt,
        this.isLiked});

  GetDataFav.fromJson(Map<String, dynamic> json) {
    idAset = json['idAset'];
    nama_aset = json['nama_aset'];
    jumlahAset = json['jumlah_aset'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    gambar = json['gambar'];
    idKategori = json['id_kategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isLiked = json['is_liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idAset'] = this.idAset;
    data['nama_aset'] = this.nama_aset;
    data['jumlah_aset'] = this.jumlahAset;
    data['harga'] = this.harga;
    data['deskripsi'] = this.deskripsi;
    data['gambar'] = this.gambar;
    data['id_kategori'] = this.idKategori;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_liked'] = this.isLiked;
    return data;
  }
}