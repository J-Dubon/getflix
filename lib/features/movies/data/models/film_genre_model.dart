import 'package:getflix/features/movies/domain/entities/film_genre_entity.dart';

class FilmGenreModel extends FilmGenreEntity {
  
  const FilmGenreModel({
    required super.id,
    required super.name
  });

  factory FilmGenreModel.fromJson(Map<String, dynamic> json) => FilmGenreModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

}