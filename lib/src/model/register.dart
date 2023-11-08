class Register {
  bool? success;
  String? message;
  Data? data;

  Register({this.success, this.message, this.data});

  Register.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? idCust;
  String? namaCust;
  String? noTelp;
  String? emailCust;
  String? passwordCust;
  String? alamat;


  Data(
      {
        this.idCust,
        this.namaCust,
        this.noTelp,
        this.emailCust,
        this.passwordCust,
        this.alamat,
       });

  Data.fromJson(Map<String, dynamic> json) {
    idCust = json['idCust'];
    namaCust = json['namaCust'];
    noTelp = json['no_telp'];
    emailCust = json['email_Cust'];
    passwordCust = json['password_Cust'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCust'] = this.idCust;
    data['namaCust'] = this.namaCust;
    data['no_telp'] = this.noTelp;
    data['email_Cust'] = this.emailCust;
    data['password_Cust'] = this.passwordCust;
    data['alamat'] = this.alamat;

    return data;
  }
}