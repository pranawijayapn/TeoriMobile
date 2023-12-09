class Television{
   int? id;
   String? name;
   double? voteAverage;
   String? overview;
   String? posterPath;
   String? FirstAirDate;
   List<String>? originCountry;
   List<int>? genreIds;
   String? original_language;
   String? backdropPath;
   String? originalName;



  Television({
    this.id,
    this.name,
    this.voteAverage,
    this.overview,
    this.posterPath,
    this.FirstAirDate,
    this.originCountry,
    this.genreIds,
    this.original_language,
    this.backdropPath,
    this.originalName,
  });
  
factory Television.fromJson(Map<String, dynamic> json) {
  return Television(
    id: json['id'] ?? 0,
    name: json['name'] ?? "",
    voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    overview: json['overview'] ?? "",
    posterPath : json['poster_path'],
    FirstAirDate: json['first_air_date'],
    originCountry: (json['origin_country'] as List<dynamic>?)?.cast<String>(),
    genreIds: (json['genre_ids'] as List<dynamic>?)?.cast<int>(),
    original_language: json['original_language'],
    backdropPath: json['backdrop_path'] ?? "",
    originalName: json['original_name'],
  );
}
}