import 'package:aplicativo/src/core/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String email = widget.user.email;
    String token = widget.user.token;
    String uid = widget.user.uid;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text(email),
              Text(token),
              Text(uid),
            ],
          )
        ),
      )
    );
  }
}