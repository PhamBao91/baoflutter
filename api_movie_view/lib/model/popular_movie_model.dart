
import 'package:flutter/material.dart';

class PopularMovieModel {
  bool adult;
  String backdrop_path;
  List<int> genre_ids;
  int id;
  String original_language;
  String original_title;
  String overview;
  var popularity;
  String poster_path;
  String release_date;
  String title;
  bool video;
  var vote_average;
  int vote_count;

  PopularMovieModel(
  {
    this.adult,
    this.backdrop_path,
    this.genre_ids,
    this.id,
    this.original_language,
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.release_date,
    this.title,
    this.video,
    this.vote_average,
    this.vote_count,
  });



  toJson() {
    return {
      "adult": this.adult,
      "backdrop_path": this.backdrop_path,
      "genre_ids": this.genre_ids,
      "id": this.id,
      "original_language": this.original_language,
      "original_title": this.original_title,
      "overview": this.overview,
      "popularity": this.popularity,
      "poster_path": this.poster_path,
      "release_date": this.release_date,
      "title": this.title,
      "video": this.video,
      "vote_average": this.vote_average,
      "vote_count": this.vote_count,
    };
  }

  factory PopularMovieModel.fromJson(json) {

    return PopularMovieModel(
      adult: json['adult'],
      backdrop_path: json['backdrop_path'],
      genre_ids: json["genre_ids"].cast<int>(), //List.from(json['genre_ids']),
      id: json['id'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
      video: json['video'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
    );
  }
}