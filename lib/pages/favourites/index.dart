import 'package:flutter/material.dart';
import 'package:movie/scoped_models/state.dart';
import 'package:scoped_model/scoped_model.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, StateModel model) {
      final movies = model.movies;
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(movies[index].id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direct) {
              model.deleteMovie(movies[index].id.toString());
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("${movies[index].title} is removed."),
                  action: SnackBarAction(
                      label: "UNDO",
                      onPressed: () {
                        model.undoMovie(index, movies[index]);
                      })));
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(movies[index].poster),
              ),
              title: Text(movies[index].title),
            ),
          );
        },
        itemCount: model.movies.length,
      );
    });
  }
}
