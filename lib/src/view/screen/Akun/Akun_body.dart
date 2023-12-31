import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/SessionManager.dart';
import 'AkunMenu.dart';
import 'Akun_pic.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/Login/login_screen.dart';
import '../Help/HelpCenter.dart';

class AkunBody extends StatelessWidget {
  late SessionManager _sessionManager;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          AkunPic(),
          SizedBox(height: 20),
          AkunMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpCenter()),
              );
            },
          ),

          AkunMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              SessionManager.clearSession();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}