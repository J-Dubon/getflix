import 'package:equatable/equatable.dart';
import 'package:getflix/features/movies/domain/entities/actor_entity.dart';

class CreditsEntity extends Equatable {
  final int id;
  final List<ActorEntity> cast;

  const CreditsEntity({
    required this.id,
    required this.cast,
  });

  @override
  List<Object?> get props => [
    id,
    cast,
  ];

  @override
  String toString() => 'CreditsEntity(id: $id, cast: $cast)';
}