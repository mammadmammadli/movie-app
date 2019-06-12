import 'package:flutter/material.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/scoped_models/state.dart';
import 'package:scoped_model/scoped_model.dart';

class LikeButton extends StatefulWidget {
  final Movie movie;
  LikeButton({this.movie});

  @override
  State<StatefulWidget> createState() {
    return _LikeButton();
  }
}

class _LikeButton extends State<LikeButton> {

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, StateModel model) {
        final isLiked = model.isMovieLiked(widget.movie);
        return Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: RaisedButton.icon(
            color: Theme.of(context).primaryColor,
            label: Text('Like'),
            icon: isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () {
              _toggleLike(model, isLiked);
            },
          ),
        );
      },
    );
  }

  void _toggleLike(StateModel model, bool isLiked) {
    if (!isLiked) {
      model.addMovie(widget.movie);
    } else {
      model.deleteMovie(widget.movie.imdbID);
    }
  }
}
