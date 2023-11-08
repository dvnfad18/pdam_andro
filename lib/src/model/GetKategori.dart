class Kategori {
  int? idKategori;
  String? kategori;
  String? createdAt;
  String? updatedAt;

  Kategori(
      {this.idKategori, this.kategori, this.createdAt, this.updatedAt});

  Kategori.fromJson(Map<String, dynamic> json) {
    idKategori = json['id_kategori'];
    kategori = json['kategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_kategori'] = this.idKategori;
    data['kategori'] = this.kategori;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}