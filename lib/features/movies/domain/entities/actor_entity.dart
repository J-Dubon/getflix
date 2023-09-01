
import 'package:equatable/equatable.dart';

class ActorEntity extends Equatable {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  const ActorEntity({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  @override
  List<Object?> get props => [
    adult,
    gender,
    id,
    knownForDepartment,
    name,
    originalName,
    popularity,
    profilePath,
    castId,
    character,
    creditId,
    order,
  ];

  @override
  String toString() => '''
    ActorEntity(
      adult: $adult,
      gender: $gender,
      id: $id,
      knownForDepartment: $knownForDepartment,
      name: $name,
      originalName: $originalName,
      popularity: $popularity,
      profilePath: $profilePath,
      castId: $castId,
      character: $character,
      creditId: $creditId,
      order: $order,
    )
  ''';
}