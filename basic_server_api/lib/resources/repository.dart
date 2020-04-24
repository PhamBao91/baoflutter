import 'package:basic_server_api/models/item_model.dart';
import 'package:basic_server_api/models/movie_detail_model.dart';

import 'movie_api_provider.dart';

class Repository {

  final movieApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMovieList();
  Future<MovieDetailModel> fetchMovieDetail(int movieId) => movieApiProvider.fetchMovieDetail(movieId);
}