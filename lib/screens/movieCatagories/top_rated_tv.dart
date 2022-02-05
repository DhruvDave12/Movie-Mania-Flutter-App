import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_mania/screens/movieDetails/details.dart';

class TopRatedTVShows extends StatefulWidget {
  List topratedtvshows;
  TopRatedTVShows({required this.topratedtvshows});

  @override
  _TopRatedTVShowsState createState() => _TopRatedTVShowsState();
}

class _TopRatedTVShowsState extends State<TopRatedTVShows> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.topratedtvshows.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details(dets: widget.topratedtvshows[index], other: widget.topratedtvshows)),
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
                                  'https://image.tmdb.org/t/p/w500${widget.topratedtvshows[index]['poster_path']}'))),
                    ),
                     widget.topratedtvshows[index]['title'] != null
                        ? Container(
                            child: Text(
                                widget.topratedtvshows[index]['title'] != null
                                    ? widget.topratedtvshows[index]['title']
                                    : widget.topratedtvshows[index]
                                        ['original_title'], style: GoogleFonts.roboto(
                                          color: Colors.white,
                                        )),
                          )
                        : Container(
                            child: Text(
                                widget.topratedtvshows[index]['name'] != null
                                    ? widget.topratedtvshows[index]['name']
                                    : widget.topratedtvshows[index]
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
