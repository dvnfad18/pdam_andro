class Users {
  int? idCust;
  String? namaCust;
  String? noTelp;
  String? emailCust;
  String? passwordCust;
  String? alamat;
  String? gambar;
  String? createdAt;
  String? updatedAt;

  Users(
      {this.idCust,
        this.namaCust,
        this.noTelp,
        this.emailCust,
        this.passwordCust,
        this.alamat,
        this.gambar,
        this.createdAt,
        this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
    idCust = json['idCust'];
    namaCust = json['namaCust'];
    noTelp = json['no_telp'];
    emailCust = json['email_Cust'];
    passwordCust = json['password_Cust'];
    alamat = json['alamat'];
    gambar = json['gambar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCust'] = this.idCust;
    data['namaCust'] = this.namaCust;
    data['no_telp'] = this.noTelp;
    data['email_Cust'] = this.emailCust;
    data['password_Cust'] = this.passwordCust;
    data['alamat'] = this.alamat;
    data['gambar'] = this.gambar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}