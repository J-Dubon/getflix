import 'package:equatable/equatable.dart';

class SpokenLanguageEntity extends Equatable {
  final String englishName;
  final String iso6391;
  final String name;

  const SpokenLanguageEntity({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  @override
  List<Object?> get props => [
    englishName,
    iso6391,
    name,
  ];

  @override
  String toString () => 'SpokenLanguageEntity(englishName: $englishName, iso6391: $iso6391, name: $name)';
}