import 'package:equatable/equatable.dart';

class BelongsToCollectionEntity extends Equatable {
  final int id;
  final String name;
  final String posterPath;
  final String? backdropPath;

  const BelongsToCollectionEntity({
    required this.id,
    required this.name,
    required this.posterPath,
    this.backdropPath,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    posterPath,
    backdropPath,
  ];

  @override
  String toString() => 'BelongsToCollection(id: $id, name: $name, posterPath: $posterPath, backdropPath: $backdropPath)';

}