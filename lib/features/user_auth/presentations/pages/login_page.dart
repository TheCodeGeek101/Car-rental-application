



import 'package:flutter/material.dart';

class LoginPage  extends StatelessWidget {
  const LoginPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),

      ),
          body: Column(
        children: [
          Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
      ],

    )
    );
  }
}
