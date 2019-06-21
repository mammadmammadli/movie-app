import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/models/paginate.dart';
import 'package:movie/services/movies.dart';

class Trending extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Trending();
  }
}

class _Trending extends State<Trending> {
  MovieService _movieService = MovieService();
  final PageController _controller = PageController(viewportFraction: 0.8);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      int next = _controller.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Pagination>(
          future: _movieService.getTrendings(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<Movie> movies = snapshot.data.results;
              return PageView.builder(
                controller: _controller,
                itemCount: movies.length + 1,
                itemBuilder: (context, int index) {
                  if (index == 0) {
                    return _buildTagPage();
                  } else if (movies.length >= index) {
                    bool active = index == currentPage;
                    return _buildStoryPage(movies[index - 1], active);
                  }
                },
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

_buildTagPage() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Top Trending',
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.w100, fontFamily: 'Roboto'),
        )
      ],
    ),
  );
}

_buildStoryPage(Movie data, bool active) {
  final double blur = active ? 30 : 0;
  final double offset = active ? 20 : 0;
  final double top = active ? 50 : 200;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeOutExpo,
    margin: EdgeInsets.only(top: top, bottom: 50, left: 10, right: 10),
    // child: data.title != null
    //     ? Center(
    //         child: Text(
    //           data.title,
    //           style: TextStyle(
    //               fontSize: 40,
    //               color: Colors.white,
    //               decoration: TextDecoration.underline),
    //         ),
    //       )
    //     : null,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            fit: BoxFit.cover,
            image:
                NetworkImage('http://image.tmdb.org/t/p/w185//${data.poster}')),
        boxShadow: [
          BoxShadow(
              color: Colors.black87,
              blurRadius: blur,
              offset: Offset(offset, offset))
        ]),
  );
}
