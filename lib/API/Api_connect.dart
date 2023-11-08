class ApiConnect {
  static const hostConnect = "https://c5de-202-80-213-12.ngrok-free.app";
  static const connectApi = "$hostConnect/api";
  static const register = "$connectApi/cust/insert";
  static const login = "$connectApi/login";
  static const app_asset = "$connectApi/getDataAset";
  static const profil = "$connectApi/getUserById";
  static const updateprofil = "$connectApi/updateProfile";
  static const favorit = "$connectApi/getDataAsetFav";
  static const detilaset = "$connectApi/getDetilAset";
  static const kategori = "$connectApi/kategori";
  static const add_datafavorit = "$connectApi/addDataFavorit";
  static const del_datafavorit = "$connectApi/deleteDataFavorit";
}