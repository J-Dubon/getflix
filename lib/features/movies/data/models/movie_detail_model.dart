import 'package:getflix/features/movies/data/models/belongs_to_collection_model.dart';
import 'package:getflix/features/movies/data/models/film_genre_model.dart';
import 'package:getflix/features/movies/data/models/production_company_model.dart';
import 'package:getflix/features/movies/data/models/production_country_model.dart';
import 'package:getflix/features/movies/data/models/spoken_language_model.dart';
import 'package:getflix/features/movies/domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {

  const MovieDetailModel({
    required super.adult, 
    required super.backdropPath, 
    required super.belongsToCollection, 
    required super.budget, 
    required super.genres, 
    required super.homepage, 
    required super.id, 
    required super.imdbId, 
    required super.originalLanguage, 
    required super.originalTitle, 
    required super.overview, 
    required super.popularity, 
    required super.posterPath, 
    required super.productionCompanies, 
    required super.productionCountries, 
    required super.releaseDate, 
    required super.revenue, 
    required super.runtime, 
    required super.spokenLanguages, 
    required super.status, 
    required super.tagline, 
    required super.title, 
    required super.video, 
    required super.voteAverage, 
    required super.voteCount
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) => MovieDetailModel(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    belongsToCollection: json["belongs_to_collection"] != null ? BelongsToCollectionModel.fromJson(json["belongs_to_collection"]) : null,
    budget: json["budget"],
    genres: List<FilmGenreModel>.from(json["genres"].map((x) => FilmGenreModel.fromJson(x))),
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    productionCompanies: List<ProductionCompanyModel>.from(json["production_companies"].map((x) => ProductionCompanyModel.fromJson(x))),
    productionCountries: List<ProductionCountryModel>.from(json["production_countries"].map((x) => ProductionCountryModel.fromJson(x))),
    releaseDate: DateTime.parse(json["release_date"]),
    revenue: json["revenue"],
    runtime: json["runtime"],
    spokenLanguages: List<SpokenLanguageModel>.from(json["spoken_languages"].map((x) => SpokenLanguageModel.fromJson(x))),
    status: json["status"],
    tagline: json["tagline"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "belongs_to_collection": belongsToCollection,
    "budget": budget,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": List<dynamic>.from(productionCompanies.map((x) => x)),
    "production_countries": List<dynamic>.from(productionCountries.map((x) => x)),
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "revenue": revenue,
    "runtime": runtime,
    "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x)),
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };

}