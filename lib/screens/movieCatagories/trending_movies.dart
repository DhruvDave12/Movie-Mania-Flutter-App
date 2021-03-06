import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_mania/screens/movieDetails/details.dart';

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Details(dets: widget.trendingMovies[index], other: widget.trendingMovies)),
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
                                  'https://image.tmdb.org/t/p/w500${widget.trendingMovies[index]['poster_path']}'))),
                    ),
                    widget.trendingMovies[index]['title'] != null
                        ? Container(
                            child: Text(
                                widget.trendingMovies[index]['title'] != null
                                    ? widget.trendingMovies[index]['title']
                                    : widget.trendingMovies[index]
                                        ['original_title'], style: GoogleFonts.roboto(
                                          color: Colors.white,
                                        )),
                          )
                        : Container(
                            child: Text(
                                widget.trendingMovies[index]['name'] != null
                                    ? widget.trendingMovies[index]['name']
                                    : widget.trendingMovies[index]
                                        ['original_name'], style: GoogleFonts.roboto(
                                          color: Colors.white,
                                        )),
                          )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
