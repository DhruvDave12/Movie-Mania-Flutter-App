import 'package:flutter/material.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/screens/authenticate/authenticate.dart';
import 'package:movie_mania/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Listening to the stream
    final user = Provider.of<Userr?>(context);

    return user != null ? Home() : Authenticate();
  }
}
