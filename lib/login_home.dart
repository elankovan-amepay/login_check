import 'package:flutter/material.dart';
import 'package:login_check/wallet_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginHome extends StatefulWidget {
  LoginHome({Key? key}) : super(key: key);

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  SharedPreferences? userCredentials;

  var isNewuser;

  getUserCredentials() async {
    userCredentials = await SharedPreferences.getInstance();
    setState(() {
      isNewuser = (userCredentials!.getString('isnewuser'));
    });
  }

  @override
  void initState() {
    getUserCredentials();
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
          children: <Widget>[
            Container(
                color: Colors.yellow,
                child: Text("isNewuser:" + isNewuser.toString())),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(
                  'Create Wallet',
                ),
                onPressed: () async {
                  userCredentials = await SharedPreferences.getInstance();
                  userCredentials!.setString('isnewuser', "no");
                  var temp = (userCredentials!.getString('isnewuser'));
                  print(temp);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return WalletHome();
                  }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(
                  'Restore Wallet',
                ),
                onPressed: () async {
                  userCredentials = await SharedPreferences.getInstance();

                  userCredentials!.setString('isnewuser', "no");

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return WalletHome();
                  }));
                },
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
