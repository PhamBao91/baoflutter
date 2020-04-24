import 'dart:async';
import 'dart:convert';
import 'package:basic_server_api/models/item_model.dart';
import 'package:basic_server_api/models/movie_detail_model.dart';
import 'package:http/http.dart' show Client, Response;

class MovieApiProvider {
  // Cần import 'package:http/http.dart' show Client
  Client client = Client ();
  final _apiKey = 'Api Key của bạn';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchMovieList() async {
    // cần add : import 'package:http/http.dart' show Response;
    Response response ;

     response = await client.get ("$_baseUrl/popular?api_key=$_apiKey");


    if(response.statusCode == 200){
      //  cần khai báo thư viện : import 'dart:convert';
      return ItemModel.fromJson(json.decode(response.body));
    }
    else {
      throw Exception(" Lỗi khi load Json");
    }
  }

  // Movie Detail

  Future<MovieDetailModel> fetchMovieDetail(int movieId) async {
    final response =
    await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Lỗi khi load');
    }
  }


}