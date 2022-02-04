import 'package:flutter/material.dart';

class TrendingMovies extends StatefulWidget {
  List trendingMovies;
  TrendingMovies({required this.trendingMovies});

  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.trendingMovies.length,
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
                                  'https://image.tmdb.org/t/p/w500${widget.trendingMovies[index]['poster_path']}'))),
                    ),
                    Container(
                      child: Text(widget.trendingMovies[index]['title'] != null
                          ? widget.trendingMovies[index]['title']
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
