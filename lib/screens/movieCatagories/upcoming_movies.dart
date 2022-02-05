import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  MaterialPageRoute(
                      builder: (context) => Details(
                          dets: widget.upcoming[index],
                          other: widget.upcoming)),
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
                    widget.upcoming[index]['title'] != null
                        ? Container(
                            child: Text(
                                widget.upcoming[index]['title'] != null
                                    ? widget.upcoming[index]['title']
                                    : widget.upcoming[index]['original_title'],
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                )),
                          )
                        : Container(
                            child: Text(
                                widget.upcoming[index]['name'] != null
                                    ? widget.upcoming[index]['name']
                                    : widget.upcoming[index]['original_name'],
                                style: GoogleFonts.roboto(
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
