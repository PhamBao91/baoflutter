class ApiUrls {

  final movieCastUrl = (movieId) => Uri.https('api.themoviedb.org', '3/movie/${movieId}/credits', {'api_key': '9bb89316d8693b06d7a84980b29c011f','language': 'vi- VN', });
  final popularMovieApiUrl = () => Uri.https('api.themoviedb.org', '/3/movie/popular', {'api_key': '9bb89316d8693b06d7a84980b29c011f','language': 'vi-VN', });

}