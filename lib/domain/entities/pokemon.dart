import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  const Pokemon({
    this.baseExperience,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.name,
    this.order,
    this.weight,
  });

  final int? baseExperience;
  final int? height;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final String? name;
  final int? order;
  final int? weight;

  @override
  List<Object?> get props => [
        baseExperience,
        height,
        id,
        isDefault,
        locationAreaEncounters,
        name,
        order,
        weight,
      ];
}
