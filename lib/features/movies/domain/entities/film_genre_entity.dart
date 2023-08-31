import 'package:equatable/equatable.dart';

class FilmGenreEntity extends Equatable{

  final int id;
  final String name;

  const FilmGenreEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
    id,
    name,
  ];

  @override
  String toString() => 'Genre(id: $id, name: $name)';
}