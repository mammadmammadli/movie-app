import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/blocs/favoriteBloc.dart';
import 'package:movie/models/baseResponse.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/pages/movie/index.dart';
import 'package:movie/scoped_models/state.dart';
import 'package:movie/services/movies.dart';
import 'package:scoped_model/scoped_model.dart';


class Result extends StatefulWidget {
  final String query;
  Result({this.query});

  @override
  State<StatefulWidget> createState() {
    return _Result();
  }
}

class _Result extends State<Result> {
  bool isLiked;
  final _bloc = FavoriteBloc();
  MovieService _movieService = MovieService();

  
  @override
  void initState() {
    super.initState();
    setState(() {
      isLiked = true;
    });
  }

  Widget movieListBuilder (List<Movie> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SingleMovie(movie)));
          },
          child: Card(
            child: ListTile(
            leading: CircleAvatar(
                backgroundImage: movie.poster != null ? NetworkImage('http://image.tmdb.org/t/p/w185//${movie.poster}') : null,
              ),
              title: Text(movie.title),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        );
      },
    );
  }

  Widget handleResultBody(StateModel model) {
    List<Movie> searchedMovies = model.searchedMovies;
    if (model.isMovieLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return searchedMovies.length > 0 
    ? movieListBuilder(searchedMovies)
    : null;
    
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, StateModel model) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: handleResultBody(model)
        ); 
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}

// Container(
//               child: StreamBuilder(
//                 stream: _bloc.counter,
//                 initialData: 0,
//                 builder: (BuildContext context, AsyncSnapshot snapshot) {
//                   int counter = snapshot.data;
//                   return RaisedButton(
//                       onPressed: () {
//                         _bloc.inCounter.add(++counter);
//                       },
//                       child: Text('Clicked ${snapshot.data}'),
//                   );
//                 },
//               ),
//             ) : movieListBuilder(model.searchedMovies),