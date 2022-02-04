import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final dets;

  Details({required this.dets});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    print(widget.dets);
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 290,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${widget.dets['backdrop_path']}'))),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ],
          )
        ],
      )),
    );
  }
}
