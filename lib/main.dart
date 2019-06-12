import 'package:flutter/material.dart';
import 'package:movie/pages/favourites/index.dart';
import 'package:movie/pages/search.dart';
import 'package:movie/scoped_models/state.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        home: MyHomePage(title: 'Movie app'),
      ),
      model: StateModel(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  final List<Map<String, dynamic>> _children = [
    {'title': 'Search', 'component': Search()},
    {'title': 'Favourite', 'component': Favorite()}
  ];

  void handleBottomNavigation(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _children[_index]['component'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedFontSize: 15.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              title: Text(
                'Search',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              title: Text(
                'Favorites',
              ))
        ],
        onTap: (index) {
          handleBottomNavigation(index);
        },
      ),
    );
  }
}
