import 'package:flutter/material.dart';
import 'package:movie_mania/models/user_data.dart';
import 'package:movie_mania/screens/profile/profile.dart';
import 'package:movie_mania/services/auth.dart';
import 'package:movie_mania/services/user_database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String uid;
  Home({required this.uid});

  @override
  _HomeState createState() => _HomeState();
}

// According to nav bar we will be rendering different pages.
class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Here we will be creating the Home, Search and Profile Sections.
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Search',
    ),
    Profile()
  ];

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
                  // Render About Us page here
                },
                icon: Icon(Icons.info, color: Colors.white),
                label: SizedBox(
                  height: 0.0,
                )),
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.logout, color: Colors.white),
                label: SizedBox(
                  height: 0.0,
                ))
          ],
        ),
        body: StreamProvider<userData>.value(
            value: Database(uid: widget.uid).dataUser,
            initialData: userData(
                uid: widget.uid,
                name: 'New',
                gender: 'Not Specified',
                address: 'No Address',
                age: 10),
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
