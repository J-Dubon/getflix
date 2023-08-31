import 'package:equatable/equatable.dart';
import 'package:getflix/features/movies/domain/entities/belongs_to_collection_entity.dart';
import 'package:getflix/features/movies/domain/entities/film_genre_entity.dart';
import 'package:getflix/features/movies/domain/entities/production_company_entity.dart';
import 'package:getflix/features/movies/domain/entities/production_country_entity.dart';
import 'package:getflix/features/movies/domain/entities/spoken_language_entity.dart';

class MovieDetailEntity extends Equatable {

  final bool adult;
  final String backdropPath;
  final BelongsToCollectionEntity? belongsToCollection;
  final int budget;
  final List<FilmGenreEntity> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompanyEntity> productionCompanies;
  final List<ProductionCountryEntity> productionCountries;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguageEntity> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieDetailEntity({
    required this.adult,
    required this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    belongsToCollection,
    budget,
    genres,
    homepage,
    id,
    imdbId,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    productionCompanies,
    productionCountries,
    releaseDate,
    revenue,
    runtime,
    spokenLanguages,
    status,
    tagline,
    title,
    video,
    voteAverage,
    voteCount,
  ];

  @override
  String toString () => '''MovieDetailEntity(
    adult: $adult, 
    backdropPath: $backdropPath, 
    belongsToCollection: $belongsToCollection, 
    budget: $budget, 
    genres: $genres, 
    homepage: $homepage, 
    id: $id, 
    imdbId: $imdbId, 
    originalLanguage: $originalLanguage, 
    originalTitle: $originalTitle, 
    overview: $overview, 
    popularity: $popularity, 
    posterPath: $posterPath, 
    productionCompanies: $productionCompanies, 
    productionCountries: $productionCountries, 
    releaseDate: $releaseDate, 
    revenue: $revenue, 
    runtime: $runtime, 
    spokenLanguages: $spokenLanguages, 
    status: $status, 
    tagline: $tagline, 
    title: $title, 
    video: $video, 
    voteAverage: $voteAverage, 
    voteCount: $voteCount
    )
  ''';
}