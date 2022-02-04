import 'package:flutter/material.dart';
import 'package:movie_mania/screens/movieDetails/details.dart';

class UpcomingMovies extends StatefulWidget {
  List upcoming;
  UpcomingMovies({required this.upcoming});
  @override
  _UpcomingMoviesState createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.upcoming.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details(dets: widget.upcoming[index])),
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
                                  'https://image.tmdb.org/t/p/w500${widget.upcoming[index]['poster_path']}'))),
                    ),
                    Container(
                      child: Text(widget.upcoming[index]['title'] != null
                          ? widget.upcoming[index]['title']
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
