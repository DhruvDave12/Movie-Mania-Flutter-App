import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_mania/models/user_data.dart';
import 'package:movie_mania/screens/movieCatagories/popular_tv_shows.dart';
import 'package:movie_mania/screens/movieCatagories/top_rated_movies.dart';
import 'package:movie_mania/screens/movieCatagories/top_rated_tv.dart';
import 'package:movie_mania/screens/movieCatagories/trending_movies.dart';
import 'package:movie_mania/screens/movieCatagories/upcoming_movies.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  List upcomingMovies = [];
  List topRatedTVShows = [];

  // Function to fetch trending movies using tMDB API
  final String apiKey = '548444b3c2cc03736baecb5bd38c0838';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NDg0NDRiM2MyY2MwMzczNmJhZWNiNWJkMzhjMDgzOCIsInN1YiI6IjYxZmExNzNjZmU2YzE4MDA5Mzg0YjcxOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AxUCmM6_OHN2VFRe4VexM3nqn2jjeHVGo2GhlJr3bVA';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map popularTV = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upcomingMoviesResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map topRatedTV = await tmdbWithCustomLogs.v3.tv.getTopRated();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = popularTV['results'];
      upcomingMovies = upcomingMoviesResult['results'];
      topRatedTVShows = topRatedTV['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final userDat = Provider.of<userData>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Hello, ${userDat.name}!!",
                //   style: GoogleFonts.openSansCondensed(
                //       color: Colors.purple[100],
                //       fontSize: 40,
                //       fontWeight: FontWeight.bold),
                // ),
                // Text(
                //   "Here are some movies and shows that can make your day!",
                //   style: GoogleFonts.openSansCondensed(
                //       color: Colors.white,
                //       fontSize: 18,
                //       fontWeight: FontWeight.w500),
                // ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Trending Movies',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                TrendingMovies(trendingMovies: trendingMovies),
                SizedBox(height: 5.0),
                Text(
                  'Upcoming Movies',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                UpcomingMovies(upcoming: upcomingMovies),
                SizedBox(height: 5.0),
                Text(
                  'Top Rated Movies',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                TopRatedMovies(topRatedMovies: topRatedMovies),
                SizedBox(height: 5.0),
                Text(
                  'Popular TV Shows',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                PopularTVShows(populartvshows: tv),
                SizedBox(height: 5.0),
                Text(
                  'Top Rated TV Shows',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                TopRatedTVShows(topratedtvshows: topRatedTVShows),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
