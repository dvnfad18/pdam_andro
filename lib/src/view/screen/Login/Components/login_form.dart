
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/API/Api_connect.dart';
import 'package:flutter_japanese_restaurant_app/constants.dart';
import 'already_have_an_account_acheck.dart';
import 'package:flutter_japanese_restaurant_app/SessionManager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/Signup/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_japanese_restaurant_app/src/view/screen/home_screen.dart';
import 'package:flutter_japanese_restaurant_app/src/model/model_user.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    checkLoginStatus(context);
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: email,
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: password,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                _handleLogin(context);
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );

  }
  void checkLoginStatus(BuildContext context) async {
    bool isLoggedIn = await SessionManager.isLoggedIn();

    if (isLoggedIn) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }
  Future<void> _handleLogin(BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(ApiConnect.login), body: {
        "email": email.text.toString(),
        "password": password.text.toString()
      });

      if (response.statusCode == 200) {
        final user = Users.fromJson(jsonDecode(response.body));

        await SessionManager.saveUserData(user);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Gagal Login",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12,
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

}