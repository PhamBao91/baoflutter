import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_test_app/data_resources/api_urls.dart';
import 'package:movie_test_app/model/popular_movie_cast_model.dart';
import 'dart:convert' show json;

import 'package:movie_test_app/model/popular_movie_model.dart';
import 'package:movie_test_app/resources/strings.dart';

class ApiServices {

  fetchAllPopularMovies() async{

    List<PopularMovieModel> popularMoviesList = [];
    var response = await http.get(ApiUrls().popularMovieApiUrl());
    if (response.statusCode == 200)
    {
        var body = json.decode(response.body);
        List listJson = body['results'];
        for(int i = 0; i < listJson.length ; i++ )
        {
          PopularMovieModel movieModel = PopularMovieModel.fromJson(listJson[i]);
          popularMoviesList.add(movieModel);
        }

    }
    else throw Exception(errorFromApi);

    return popularMoviesList;
  }


  fetchMovieCast(movieId) async {

    List<PopularMovieCastModel> popularMoviesCastList = [];
    var fullVideoUrl = ApiUrls().movieCastUrl(movieId);

    var response = await http.get(fullVideoUrl);


    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      List listJson = body['cast'];
      for(int i = 0; i < listJson.length ; i++ )
      {
        if (listJson[i]['profile_path'] != null) {
          PopularMovieCastModel castModel = PopularMovieCastModel.fromJson(listJson[i]);
          popularMoviesCastList.add(castModel);
        }


      }

    }
    else throw Exception(errorFromApi);

    return popularMoviesCastList;
  }
}