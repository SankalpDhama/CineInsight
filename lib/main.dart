import 'package:flutter/material.dart';
import 'package:movie_reviewer/utils/utils.dart';
import 'package:movie_reviewer/widgets/ScrollWidget.dart';
import 'package:movie_reviewer/widgets/TvShows.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List topRatedMovies = [];
  List popularTvShows = [];
  final String apiKey = 'c2c19b20ee6b9fe131e7b50597e1e2f9';
  final apiAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMmMxOWIyMGVlNmI5ZmUxMzFlN2I1MDU5N2UxZTJmOSIsInN1YiI6IjY0ZDA3YTMzNmQ0Yzk3MDEwZDUxNTVkNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zh13X2scd8EsiLqS03PsR-ydi2s-bvRIARk6fi8j7Lw';
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, apiAccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map topratedmoviesresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map populartvshowsresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    // print(populartvshowsresult);
    setState(() {
      topRatedMovies = topratedmoviesresult['results'];
      popularTvShows = populartvshowsresult['results'];
    });
    print(topratedmoviesresult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modifiedText(
          text: 'Movies Reviewer',
        ),
      ),
      body: ListView(
        children:[
          ScrollWidget(
            nameLists: topRatedMovies, title: 'Top Rated Movies', name: 'title',
          ),
          TvShows(tvLists: popularTvShows),
        ]
      ),
    );
  }
}
