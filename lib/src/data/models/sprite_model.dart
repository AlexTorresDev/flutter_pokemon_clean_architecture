import 'package:flutter_pokemon_clean_architecture/src/domain/entities/sprite.dart';

class SpriteModel extends Sprite {
  const SpriteModel({
    super.backDefault,
    super.backFemale,
    super.backShiny,
    String? backShinyFemale,
    super.frontDefault,
    super.frontFemale,
    super.frontShiny,
    super.frontShinyFemale,
  }) : super(backShinyFemale: backShiny);

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
