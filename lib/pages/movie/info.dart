import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String title;
  final String year;
  final String imdbRating;
  final String plot;

  Info({this.title, this.year, this.imdbRating, this.plot});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text("${this.title} (${this.year})", style: TextStyle(fontSize: 20),),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text("Imdb Rating: ${this.imdbRating}", style: TextStyle(fontSize: 14),),
        ),
        Padding(padding: EdgeInsets.only(top: 10.0),
          child: Text("${this.plot}"),
        )
      ],
    );
  }
}
