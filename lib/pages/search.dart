import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/pages/movie/result.dart';
import 'package:movie/scoped_models/state.dart';
import 'package:scoped_model/scoped_model.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Search();
  }
}

class _Search extends State<Search> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, StateModel model) {
        _textEditingController.text = model.searchQuery;
        return Scaffold(
            appBar: AppBar(
              title: Text('Search'),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Theme(
                          data: ThemeData(primaryColor: Colors.cyan[50]),
                          child: TextFormField(
                            controller: _textEditingController,
                              style: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (String value) {
                                // _textEditingController.value = TextEditingValue(text: value);
                                model.searchMovie(value);
                              },
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.clear, color: Colors.black,),
                                    onPressed: () {
                                      _textEditingController.clear();
                                      model.clear();
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).accentColor),
                                  fillColor: Theme.of(context).accentColor)),
                        )
                  ),
                  Expanded(
                      child: Result(
                              query: model.searchQuery,
                            )
                    )
                ],
              ),
            ));
      },
    );
  }
}
