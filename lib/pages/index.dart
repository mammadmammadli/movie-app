import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/trendings/index.dart';

import 'favourites/index.dart';
import 'search.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Index();
  }
}

class _Index extends State<Index> {
  @override
  void initState() {
    super.initState();
  }

  int _index = 0;
  int _favMovie = 0;
  final List<Map<String, dynamic>> _children = [
    {'title': 'Tredning', 'component': Trending()},
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
          title: Text('Movies', style: TextStyle(fontWeight: FontWeight.w400),),
        ),
        body: _children[_index]['component'],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.cyan,
          selectedFontSize: 15.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              title: Text('Trendings')
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                title: Text(
                  'Search',
                )),
            BottomNavigationBarItem(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(_favMovie.toString()),
                    )
                  ],
                ),
                title: Text(
                  'Favorites',
                ))
          ],
          onTap: (index) {
            handleBottomNavigation(index);
          },
        ));
  }
}
