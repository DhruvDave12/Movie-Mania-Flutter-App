import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_mania/screens/movieDetails/details.dart';

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(
                          dets: widget.topRatedMovies[index],
                          other: widget.topRatedMovies)),
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
                                  'https://image.tmdb.org/t/p/w500${widget.topRatedMovies[index]['poster_path']}'))),
                    ),
                    widget.topRatedMovies[index]['title'] != null
                        ? Container(
                            child: Text(
                              widget.topRatedMovies[index]['title'] != null
                                  ? widget.topRatedMovies[index]['title']
                                  : widget.topRatedMovies[index]
                                      ['original_title'],
                              style: GoogleFonts.roboto(color: Colors.white),
                            ),
                          )
                        : Container(
                            child: Text(
                              widget.topRatedMovies[index]['name'] != null
                                  ? widget.topRatedMovies[index]['name']
                                  : widget.topRatedMovies[index]
                                      ['original_name'],
                              style: GoogleFonts.roboto(color: Colors.white),
                            ),
                          )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
