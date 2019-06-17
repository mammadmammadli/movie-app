import 'package:flutter/material.dart';

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
        title: Text('Index'),
      ),
      body: _children[_index]['component'],
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
    )
    );
  }
}