import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'wallet_home.dart';
import 'login_home.dart';

class LoginCheck extends StatefulWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  State<LoginCheck> createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  SharedPreferences? userCredentials;
  String isNewuser = "yes";

  getUserCredentials() async {
    print("****getUserCredentials()****");

    userCredentials = await SharedPreferences.getInstance();
    isNewuser = (userCredentials!.getString('isnewuser') ?? "yes");

    if (isNewuser == "no") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WalletHome();
      }));
    }
    if (isNewuser == "yes") {
      (userCredentials!.setString('isnewuser', 'yes'));

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginHome();
      }));
    }
  }

  @override
  void initState() {
    print("****Login-Check****");
    super.initState();
    getUserCredentials().whenComplete(() {
      print("****getUserCredentials-completed!****");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Check"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Colors.yellow, child: Text("isNewuser: $isNewuser")),
            Text("Connecting..."),
          ],
        ),
      ), //
    );
  }
}
