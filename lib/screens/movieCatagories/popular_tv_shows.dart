import 'package:flutter/material.dart';
import 'package:movie_mania/screens/movieDetails/details.dart';

class PopularTVShows extends StatefulWidget {
  List populartvshows;
  PopularTVShows({required this.populartvshows});

  @override
  _PopularTVShowsState createState() => _PopularTVShowsState();
}

class _PopularTVShowsState extends State<PopularTVShows> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 270.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.populartvshows.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details(dets: widget.populartvshows[index])),
                );
              },
              child: Container(
                width: 140,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${widget.populartvshows[index]['poster_path']}'))),
                    ),
                    Container(
                      child: Text(widget.populartvshows[index]['name'] != null
                          ? widget.populartvshows[index]['name']
                          : 'Loading'),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
