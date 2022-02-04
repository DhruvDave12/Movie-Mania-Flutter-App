import 'package:flutter/material.dart';

class TopRatedMovies extends StatefulWidget {
  List topRatedMovies;
  TopRatedMovies({required this.topRatedMovies});
  @override
  _TopRatedMoviesState createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.topRatedMovies.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
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
                                  'https://image.tmdb.org/t/p/w500${widget.topRatedMovies[index]['poster_path']}'))),
                    ),
                    Container(
                      child: Text(widget.topRatedMovies[index]['title'] != null
                          ? widget.topRatedMovies[index]['title']
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
