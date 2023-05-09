// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widget/topRated.dart';
import 'package:movie_app/widget/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movie_app/widget/trending.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apiKey = '40c9519e445aee703d961ef37e23a6fe';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MGM5NTE5ZTQ0NWFlZTcwM2Q5NjFlZjM3ZTIzYTZmZSIsInN1YiI6IjY0NTUzNDdkNjNhNjk1MDEwMWUzZDRjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.euYc3VMfli5XWNZ5ISuobzBnP16hhdGZ-GQvaf52obA';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readaccesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingresult['results'];
      topratedmovies = topratedresults['results'];
      tv = tvresults['results'];
      print(tv);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const textModify(
          text: 'My Movie App',
          color: Colors.white,
          size: 20,
        ),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}
