import 'package:flutter/material.dart';
import 'package:movie/models/movie.dart';

class SingleMovie extends StatelessWidget {
  final Movie movie;
  SingleMovie(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              iconTheme: IconThemeData(
                color: Colors.white
              ),
              expandedHeight: 600.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.cyan,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.pin,
                    title: top < 150 ? AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: top < 140 ? 1.0 : 0.0,
                      child: Text(movie.title ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w100, 
                          fontFamily: 'Roboto',
                          shadows: [
                            Shadow(color: Colors.black)
                          ]
                        )
                      ) ,
                    ): null,
                    background: Image.network(
                      movie.poster != null 
                      ?'http://image.tmdb.org/t/p/w185//${movie.poster}'
                      : 'https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/256x256/plain/movies.png',
                      fit: BoxFit.cover,
                    )
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2))
                    ),
                    child: Center(
                      child: Text(
                        movie.title ?? '',
                        style: TextStyle(
                          fontSize: 30.0,  
                          fontWeight: FontWeight.w100, 
                            fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2))
                    ),
                    child: Center(
                      child: Text(
                        movie.release_date ?? '', 
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w100, 
                            fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2))
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          movie.overview ?? '', 
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w100, 
                              fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {},
        child: Icon(Icons.favorite_border,),
      ),
    );
  }
}
