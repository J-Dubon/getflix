import 'package:getflix/features/movies/domain/entities/actor_entity.dart';

class ActorModel extends ActorEntity {
  const ActorModel({
    required super.adult, 
    required super.gender, 
    required super.id, 
    required super.knownForDepartment, 
    required super.name, 
    required super.originalName, 
    required super.popularity, 
    super.profilePath,
    required super.castId, 
    required super.character, 
    required super.creditId, 
    required super.order
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownForDepartment: json["known_for_department"]!,
    name: json["name"],
    originalName: json["original_name"],
    popularity: json["popularity"]?.toDouble(),
    profilePath: json["profile_path"],
    castId: json["cast_id"],
    character: json["character"],
    creditId: json["credit_id"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for_department": knownForDepartment,
    "name": name,
    "original_name": originalName,
    "popularity": popularity,
    "profile_path": profilePath,
    "cast_id": castId,
    "character": character,
    "credit_id": creditId,
    "order": order,
  };

}