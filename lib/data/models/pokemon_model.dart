import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    int? baseExperience,
    int? height,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    String? name,
    int? order,
    int? weight,
  }) : super(
          baseExperience: baseExperience,
          height: height,
          id: id,
          isDefault: isDefault,
          locationAreaEncounters: locationAreaEncounters,
          name: name,
          order: order,
          weight: weight,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        name: json["name"],
        order: json["order"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "name": name,
        "order": order,
        "weight": weight,
      };
}
