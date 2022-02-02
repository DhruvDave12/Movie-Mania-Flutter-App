import 'package:flutter/material.dart';
import 'package:movie_mania/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";

  String error = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Register"),
          elevation: 0.0,
          actions: [
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text("Sign In", style: TextStyle(color: Colors.white))),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                    validator: (val) => val!.isEmpty ? "Enter an email" : null,
                    onChanged: (val) => {setState(() => email = val)},
                    decoration: InputDecoration(
                        hintText: "Email",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0)))),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    validator: (val) =>
                        val!.length < 6 ? "Enter Password 6+ chars long" : null,
                    onChanged: (val) => {setState(() => password = val)},
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0)))),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);

                      if (result == null) {
                        setState(() {
                          error = "Please supply valid credentials";
                        });
                      }
                    }
                  },
                  color: Colors.red,
                  child:
                      Text("Register", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20.0,
                  child: Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
