import 'package:equatable/equatable.dart';

class ProductionCountryEntity extends Equatable {

  final String iso31661;
  final String name;

  const ProductionCountryEntity({
    required this.iso31661,
    required this.name,
  });

  @override
  List<Object?> get props => [
    iso31661,
    name,
  ];

  @override
  String toString () => 'ProductionCountryEntity(iso31661: $iso31661, name: $name)';
  
}