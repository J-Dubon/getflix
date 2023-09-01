import 'package:getflix/features/movies/data/models/actor_model.dart';
import 'package:getflix/features/movies/domain/entities/credits_entity.dart';

class CreditsModel extends CreditsEntity {
  const CreditsModel({
    required super.id, 
    required super.cast
  });

  factory CreditsModel.fromJson(Map<String, dynamic> json) => CreditsModel(
    id: json["id"],
    cast: List<ActorModel>.from(json["cast"].map((x) => ActorModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": List<dynamic>.from(cast.map((x) => x)),
  };

}