import 'package:flutter/material.dart';
import 'package:movie/scoped_models/state.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/auth/index.dart';
import 'pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  final StateModel state = StateModel();
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<StateModel>(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.amber,
          toggleableActiveColor: Colors.white,
        ),
        home: Scaffold(
          body: Center(
            child: this._isAuthenticated ? Index () : AuthIndex(),
          ),
        ),
      ),
      model: StateModel(),
    );
  }
}
