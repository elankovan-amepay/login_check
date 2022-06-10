import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_check.dart';

class WalletHome extends StatelessWidget {
  WalletHome({Key? key}) : super(key: key);

  SharedPreferences? userCredentials;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Wallet Home")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout_outlined),
        onPressed: () async {
          userCredentials = await SharedPreferences.getInstance();

          userCredentials!.setString('isnewuser', "yes");

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return LoginCheck();
          }));
        },
      ),
    );
  }
}
