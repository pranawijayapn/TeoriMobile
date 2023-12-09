class Movie {
   int? id;
   String? title;
   double? voteAverage;
   String? overview;
   String? posterPath;
   String? ReleaseDate;
   String? original_language;
   String? originalTitle;
   double? popularity;
   

  Movie({
    this.id,
    this.title,
    this.voteAverage,
    this.overview,
    this.posterPath,
    this.ReleaseDate,
    this.original_language,
    this.originalTitle,
    this.popularity,
  });
  
factory Movie.fromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] ?? 0,
    title: json['title'] ?? "",
    voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    overview: json['overview'] ?? "",
    posterPath: json['poster_path'] ?? "",
    ReleaseDate: json['release_date'] ?? "",
    original_language: json['original_language'] ?? "",
    originalTitle: json['original_title'] ?? "",
    popularity: json['popularity'] ?? "",
  );
}
}
