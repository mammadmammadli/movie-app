import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/blocs/favoriteBloc.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/pages/movie/likeButton.dart';

import 'info.dart';

class Result extends StatefulWidget {
  final String query;
  Result({this.query});

  @override
  State<StatefulWidget> createState() {
    return _Result();
  }
}

class _Result extends State<Result> {
  final String _apiKey = "apikey=4989e4c";
  final String url = "http://www.omdbapi.com/";
  bool isLiked;
  final _bloc = FavoriteBloc();
  
  @override
  void initState() {
    super.initState();
    setState(() {
      isLiked = true;
    });
  }

  void addFav() {

  }


  Future<http.Response> fetchFilm() {
    final endpoint = "${this.url}?${this._apiKey}&t=${widget.query}";
    var response = http.get(endpoint);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: widget.query.isNotEmpty ? FutureBuilder(
          future: fetchFilm(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting: 
                return CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasData && json.decode(snapshot.data.body)['imdbID'] != null) {
                  Movie movie = Movie.fromJson(json.decode(snapshot.data.body));
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: ListView(
                        children: <Widget>[
                          GestureDetector(
                            child: Image.network(movie.poster),
                          ),
                          LikeButton(
                            movie: movie,
                          ),
                          Info(
                            title: movie.title,
                            imdbRating: movie.vote_average.toString(),
                          ),
                        ],
                      )
                    ),
                  );
                }
                return Text('No movie');
              default:
                return Text('Error');
            }
          }
        ) : Container(
          child: StreamBuilder(
            stream: _bloc.counter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              int counter = snapshot.data;
              return RaisedButton(
                  onPressed: () {
                    _bloc.inCounter.add(++counter);
                  },
                  child: Text('Clicked ${snapshot.data}'),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}