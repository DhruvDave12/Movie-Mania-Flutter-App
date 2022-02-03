import 'package:flutter/material.dart';
import 'package:movie_mania/models/user_data.dart';
import 'package:movie_mania/services/user_database.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // this fetches the stream
    final userDat = Provider.of<userData>(context);

    return StreamBuilder<userData>(
        stream: Database(uid: userDat.uid).dataUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            userData? usersData = snapshot.data;
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(usersData!.name),
                  Text(usersData.gender),
                  Text(usersData.address),
                  Text((usersData.age).toString()),
                ],
              ),
            );
          } else {
            return Text("No Data");
          }
        });
  }
}
