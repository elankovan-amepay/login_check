import 'package:flutter/material.dart';

import 'login_check.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // APPLICATION STARTS HERE;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginCheck(),
    );
  }
}
