import 'package:flutter/material.dart';
import 'package:movie_mania/models/user_data.dart';
import 'package:movie_mania/services/user_database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var url = '';

  @override
  Widget build(BuildContext context) {
    // this fetches the stream
    final userDat = Provider.of<userData>(context);

    getImageURL() async {
      final ref = await FirebaseStorage.instance
          .ref('files/image_${userDat.uid}.jpeg')
          .getDownloadURL();
      setState(() {
        this.url = ref;
      });
    }

    getImageURL();
    print(this.url);
    return StreamBuilder<userData>(
        stream: Database(uid: userDat.uid).dataUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            userData? usersData = snapshot.data;
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  url == '' ? Text("Image Loading...") : Image.network(url),
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
