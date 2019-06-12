import 'package:flutter/material.dart';
import 'package:movie/scoped_models/state.dart';
import 'package:scoped_model/scoped_model.dart';

class LikeButton extends StatefulWidget {
  final String imdbID;
  LikeButton({this.imdbID});

  @override
  State<StatefulWidget> createState() {
    return _LikeButton();
  }
}

class _LikeButton extends State<LikeButton> {
  bool isLiked;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLiked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, StateModel model) {
        return Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: RaisedButton.icon(
            color: Theme.of(context).primaryColor,
            label: Text('Like'),
            icon: isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () {
              _toggleLike(model);
            },
          ),
        );
      },
    );
  }

  void _toggleLike(StateModel model) {
    if (this.isLiked) {
      model.addMovie(widget.imdbID);
    } else {
      model.deleteMovie(widget.imdbID);
    }
    setState(() {
      isLiked = !this.isLiked;
    });
  }
}
