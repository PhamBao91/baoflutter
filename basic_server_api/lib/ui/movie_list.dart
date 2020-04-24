import 'package:basic_server_api/blocs/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:basic_server_api/models/item_model.dart';
import 'package:basic_server_api/blocs/movie_detail_bloc.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MovieListState();
  }


}

class _MovieListState extends State<MovieList>
{

  final bloc = MoviesBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // load data to Bloc
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // đóng bloc
    bloc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Phim phổ biến"),
      ),

      // get data từ stream
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot){
          if(snapshot.hasData){
            return buildList(snapshot);
          }
          else if (snapshot.hasError)
            return Text(snapshot.error.toString());

          // show loading data trước khi get data

          return Center(child:  CircularProgressIndicator());


        },
      ),
    );
  }

  Widget buildList (AsyncSnapshot<ItemModel> snapshot)
  {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index){
       return GridTile(
          child: InkResponse(
            enableFeedback: true,
            child: Image.network('https://image.tmdb.org/t/p/w185${snapshot.data
                .results[index].poster_path}',
              fit: BoxFit.cover,
            ),
            onTap: () => openDetailPage(snapshot.data, index),
          ),
        );
      },


    );


  }

  openDetailPage(ItemModel data, int index) {
    final page = MovieDetailBlocProvider(
      child: MovieDetail(
        title: data.results[index].title,
        posterUrl: data.results[index].backdrop_path,
        description: data.results[index].overview,
        releaseDate: data.results[index].release_date,
        voteAverage: data.results[index].vote_average.toString(),
        movieId: data.results[index].id,
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return page;
      }),
    );
  }





}