import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/models/movie.dart';


class Result extends StatelessWidget {
  final String query;
  final String _apiKey = "apikey=4989e4c";
  final String url = "http://www.omdbapi.com/";

  Result({this.query});

  Future<http.Response> fetchFilm() {
    final endpoint = "${this.url}?${this._apiKey}&t=${this.query}";
    var response = http.get(endpoint);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    print("render");
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: FutureBuilder(
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
                          Image.network(movie.poster),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text("${movie.title} (${movie.year})", style: TextStyle(fontSize: 20),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text("Imdb Rating: ${movie.imdbRating}", style: TextStyle(fontSize: 14),),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0),
                            child: Text("${movie.plot}"),
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
        ),
      ),
    );
  }
}