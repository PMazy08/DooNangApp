class Movie{
  final String genre;
  final int movieId;
  final String name_movie;
  final String pic_movie;
  final String rate;
  final String videoLink;





  Movie.fromJson(Map<String, dynamic> json)
    : genre = json['genre'] ?? " ",
    movieId = json['movieId']?? 0,
    name_movie = json['name_movie'] ?? "",
    pic_movie = json['pic_movie'] ?? "",
    rate = json['rate'] ?? "",
    videoLink = json['videoLink'] ?? " ";



}

