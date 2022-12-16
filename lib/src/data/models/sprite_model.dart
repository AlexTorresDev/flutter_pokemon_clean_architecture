import 'package:flutter_pokemon_clean_architecture/src/domain/entities/entities.dart';

class SpriteModel extends Sprite {
  const SpriteModel({
    String? backDefault,
    String? backFemale,
    String? backShiny,
    String? backShinyFemale,
    String? frontDefault,
    String? frontFemale,
    String? frontShiny,
    String? frontShinyFemale,
  }) : super(
          backDefault: backDefault,
          backFemale: backFemale,
          backShiny: backShiny,
          backShinyFemale: backShiny,
          frontDefault: frontDefault,
          frontFemale: frontFemale,
          frontShiny: frontShiny,
          frontShinyFemale: frontShinyFemale,
        );

  factory SpriteModel.fromJson(Map<String, dynamic> json) => SpriteModel(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}
