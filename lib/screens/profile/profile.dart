import 'package:flutter/material.dart';
import 'package:movie_mania/models/user_data.dart';
import 'package:movie_mania/services/user_database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
              // padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 270.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/movie.png"),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8.0),
                        height: 300.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                                radius: 50, backgroundImage: NetworkImage(url)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5.0,
                      child: Container(
                        width: double.infinity,
                        height: 280,
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(usersData!.name,
                                      style: GoogleFonts.josefinSans(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(usersData.gender,
                                      style: GoogleFonts.josefinSans(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(usersData.address,
                                      style: GoogleFonts.josefinSans(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text((usersData.age).toString(),
                                      style: GoogleFonts.josefinSans(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                            SvgPicture.asset("assets/images/award_man.svg"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RawMaterialButton(
                          elevation: 0.0,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0,
                          ),
                          shape: CircleBorder(),
                          fillColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text("No Data");
          }
        });
  }
}
