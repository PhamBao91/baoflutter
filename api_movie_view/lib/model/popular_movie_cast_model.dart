
import 'package:flutter/material.dart';

class PopularMovieCastModel {
  bool adult;
  int gender;
  int id;
  String known_for_department;
  String name;
  String original_name;
  var popularity;
  String profile_path;
  int cast_id;
  String character;
  String credit_id;
  int order;



  PopularMovieCastModel(
  {
    this.adult,
    this.gender,
    this.id,
    this.known_for_department,
    this.name,
    this.original_name,
    this.popularity,
    this.profile_path,
    this.cast_id,
    this.character,
    this.credit_id,
    this.order,

  });

  toJson() {
    return {
      "adult": this.adult,
      "gender": this.gender,
      "id": this.id,
      "known_for_department": this.known_for_department,
      "name": this.name,
      "original_name": this.original_name,
      "popularity": this.popularity,
      "profile_path": this.profile_path,
      "cast_id": this.cast_id,
      "character": this.character,
      "credit_id": this.credit_id,
      "order": this.order,
    };
  }

  factory PopularMovieCastModel.fromJson(json) {
    return PopularMovieCastModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      known_for_department: json['known_for_department'],
      name: json['name'],
      original_name: json['original_name'],
      popularity: json['popularity'],
      profile_path: json['profile_path'],
      cast_id: json['cast_id'],
      character: json['character'],
      credit_id: json['credit_id'],
      order: json['order'],
    );
  }
}