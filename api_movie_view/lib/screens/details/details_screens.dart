import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_test_app/data_resources/api_services.dart';
import 'package:movie_test_app/data_resources/url_strings.dart';
import 'package:movie_test_app/model/item_cast.dart';
import 'package:movie_test_app/model/popular_movie_cast_model.dart';
import 'package:movie_test_app/model/popular_movie_model.dart';

import '../../model/item_popular.dart';

class DetailsScreen extends StatelessWidget {
  final PopularMovieModel itemPopular;
  const DetailsScreen({Key key, this.itemPopular}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            BG_IN_DETAIL_LINK + itemPopular.backdrop_path,

            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),

          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context)
        ],
      ),
    );
  }

  _body(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(
          height: 20,
        ),
        _header(),
        SizedBox(
          height: 20,
        ),
        _cast(),
        SizedBox(
          height: 20,
        ),
        _overview()
      ],
    );
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 113,
            height: 153,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(POSTER_IN_DETAIL_LINK + itemPopular.poster_path))),
          ),
          SizedBox(
            width: 18,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                itemPopular.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Xuất bản:   " + itemPopular.release_date,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thể Loaị: ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      itemPopular.genre_ids.join(", "),
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  _cast() {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 160,
            child: FutureBuilder(
                future: ApiServices().fetchMovieCast(itemPopular.id),
                builder: (context, snapshot) {
                  if((snapshot.hasError)||(!snapshot.hasData))
                    return Center(
                      child: Text("Loading.."),
                    );
                  List<PopularMovieCastModel> castList = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: castList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _itemCast(castList[index]);
                    },
                  );
              }
            ),
          )
        ],
      ),
    );
  }
  
  _itemCast(PopularMovieCastModel itemCast) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Expanded(
              child: Container(
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(POSTER_IN_DETAIL_LINK + itemCast.profile_path))),
          )),
          SizedBox(
            height: 4,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              itemCast.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              itemCast.character,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  _overview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overview",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            itemPopular.overview,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
