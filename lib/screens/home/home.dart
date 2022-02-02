import 'package:flutter/material.dart';
import 'package:movie_mania/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Movie Mania"),
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  return await _auth.signOut();
                },
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text("LogOut", style: TextStyle(color: Colors.white)))
          ],
        ),
        body: Container(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
