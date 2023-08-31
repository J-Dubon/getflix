import 'package:equatable/equatable.dart';

class ProductionCompanyEntity extends Equatable {
  
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  const ProductionCompanyEntity({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  @override
  List<Object?> get props => [
    id,
    logoPath,
    name,
    originCountry,
  ];

  @override
  String toString() => 'ProductionCompanyEntity(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';

}