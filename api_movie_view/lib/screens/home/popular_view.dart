import 'package:flutter/material.dart';
import 'package:movie_test_app/data_resources/api_services.dart';
import 'package:movie_test_app/data_resources/url_strings.dart';
import 'package:movie_test_app/model/item_popular.dart';
import 'package:movie_test_app/model/popular_movie_model.dart';
import 'package:movie_test_app/screens/details/details_screens.dart';

class PopularView extends StatefulWidget {
  @override
  _PopularViewState createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServices().fetchAllPopularMovies(),
        builder: (context, snapshot) {
          if((snapshot.hasError)||(!snapshot.hasData))
            return Center(
              child: Text("Loading.."),
            );
          List<PopularMovieModel> moviesList = snapshot.data;
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.62,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 30),
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              return _itemPopular(context, moviesList[index]);
            },
          );
      }
    );
  }

  Widget _itemPopular(BuildContext context, PopularMovieModel itemPopular) {


    return GestureDetector(
      onTap: () {
         Navigator.push(
             context, MaterialPageRoute(builder: (_) => DetailsScreen(itemPopular: itemPopular)));
      },
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(POSTER_IN_DETAIL_LINK + itemPopular.poster_path))),

                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black],
                            stops: [0.5, 1])),
                  ),
                  Positioned(
                      bottom: 12,
                      right: 16,
                      child: Text(
                        itemPopular.release_date,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  itemPopular.original_title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }

}
