import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Details extends StatefulWidget {
  final dets;
  List other = [];

  Details({required this.dets, required this.other});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    super.initState();
    loadRecommendedMovies();
  }

  List recommendedMovies = [];
  // Function to get recommended movies list
  final String apiKey = '548444b3c2cc03736baecb5bd38c0838';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NDg0NDRiM2MyY2MwMzczNmJhZWNiNWJkMzhjMDgzOCIsInN1YiI6IjYxZmExNzNjZmU2YzE4MDA5Mzg0YjcxOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AxUCmM6_OHN2VFRe4VexM3nqn2jjeHVGo2GhlJr3bVA';
  loadRecommendedMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map recommendedResult =
        await tmdbWithCustomLogs.v3.movies.getRecommended(widget.dets['id']);
    setState(() {
      recommendedMovies = recommendedResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.dets);
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 290,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${widget.dets['backdrop_path']}'))),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        widget.dets['title'] != null
                            ? Text(
                                widget.dets['title'] != null
                                    ? "${widget.dets['title']} [${widget.dets['original_language'].toString().toUpperCase()}]"
                                    : "${widget.dets['original_title']} [${widget.dets['original_language'].toString().toUpperCase()}]",
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                widget.dets['name'] != null
                                    ? "${widget.dets['name']} [${widget.dets['original_language'].toString().toUpperCase()}]"
                                    : "${widget.dets['original_name']} [${widget.dets['original_language'].toString().toUpperCase()}]",
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                        widget.dets['title'] != null
                            ? Text(
                                widget.dets['original_title'] != null
                                    ? widget.dets['original_title']
                                    : widget.dets['title'],
                                style: GoogleFonts.robotoCondensed(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )
                            : Text(
                                widget.dets['original_name'] != null
                                    ? widget.dets['original_name']
                                    : widget.dets['name'],
                                style: GoogleFonts.robotoCondensed(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Average Rating: ${widget.dets['vote_average'].toString()} / 10',
                          style: TextStyle(
                              color: Colors.red[200],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        widget.dets['overview'].toString().isEmpty == false
                            ? Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(widget.dets['overview'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              )
                            : Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        widget.dets['release_date'] != null
                            ? Text(
                                "Release Date: ${widget.dets['release_date']}",
                                style: GoogleFonts.robotoCondensed(
                                  color: Colors.yellow[200],
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                "Release Date: ${widget.dets['first_air_date']}",
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.yellow[200],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        recommendedMovies.length != 0
                            ? Text(
                                'Recommended Movies',
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              )
                            : SizedBox(
                                height: 1,
                              ),
                        recommendedMovies.length != 0
                            ? Container(
                                height: 270,
                                width: double.infinity,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: recommendedMovies.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Details(
                                                      dets: recommendedMovies[
                                                          index],
                                                      other: widget.other,
                                                    )),
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
                                                            'https://image.tmdb.org/t/p/w500${recommendedMovies[index]['poster_path']}'))),
                                              ),
                                              recommendedMovies[index]
                                                          ['title'] !=
                                                      null
                                                  ? Container(
                                                      child: Text(
                                                        recommendedMovies[index]
                                                                    ['title'] !=
                                                                null
                                                            ? recommendedMovies[
                                                                index]['title']
                                                            : recommendedMovies[
                                                                    index][
                                                                'original_title'],
                                                        style: GoogleFonts
                                                            .robotoCondensed(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      child: Text(
                                                        recommendedMovies[index]
                                                                    ['name'] !=
                                                                null
                                                            ? recommendedMovies[
                                                                index]['name']
                                                            : recommendedMovies[
                                                                    index][
                                                                'original_name'],
                                                        style: GoogleFonts
                                                            .robotoCondensed(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            : Container(
                                height: 270,
                                width: double.infinity,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.other.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Details(
                                                    dets: widget.other[index],
                                                    other: widget.other)),
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
                                                            'https://image.tmdb.org/t/p/w500${widget.other[index]['poster_path']}'))),
                                              ),
                                              widget.other[index]['title'] !=
                                                      null
                                                  ? Container(
                                                      child: Text(
                                                        widget.other[index]
                                                                    ['title'] !=
                                                                null
                                                            ? widget.other[
                                                                index]['title']
                                                            : widget.other[
                                                                    index][
                                                                'original_title'],
                                                        style: GoogleFonts
                                                            .robotoCondensed(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      child: Text(
                                                        widget.other[index]
                                                                    ['name'] !=
                                                                null
                                                            ? widget.other[
                                                                index]['name']
                                                            : widget.other[
                                                                    index][
                                                                'original_name'],
                                                        style: GoogleFonts
                                                            .robotoCondensed(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                      ]),
                ),
              ]),
            )));
  }
}
