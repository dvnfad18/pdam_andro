import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_japanese_restaurant_app/API/Api_connect.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/Login/Components/already_have_an_account_acheck.dart';
import 'package:flutter_japanese_restaurant_app/constants.dart';
import 'package:flutter_japanese_restaurant_app/src/view/screen/Login/login_screen.dart';
import 'package:flutter_japanese_restaurant_app/src/model/register.dart';


class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);

  final TextEditingController namaCust = TextEditingController();
  final TextEditingController email_Cust = TextEditingController();
  final TextEditingController no_telp = TextEditingController();
  final TextEditingController password_Cust = TextEditingController();
  final TextEditingController alamat = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: namaCust,
            decoration: const InputDecoration(
              hintText: "Nama",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              controller: email_Cust,
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.mail),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              controller: no_telp,
              decoration: const InputDecoration(
                hintText: "NoHp",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.phone),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: password_Cust,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              controller: alamat,
              decoration: const InputDecoration(
                hintText: "Alamat",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.home),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              _handleRegister(context);
            },
            child: Text(
              "Register".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _handleRegister(BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(ApiConnect.register), body: {
        "email_Cust": email_Cust.text.toString(),
        "password_Cust": password_Cust.text.toString(),
        "namaCust": namaCust.text.toString(),
        "no_telp": no_telp.text.toString(),
        "alamat" :alamat.text.toString()
      });

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final register = Register.fromJson(jsonData);
        if (register.success == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          Fluttertoast.showToast(
            msg: email_Cust.text.toString(),
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: password_Cust.text.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12,
        );
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }
}
