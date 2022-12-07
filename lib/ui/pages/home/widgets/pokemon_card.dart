import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    String imageURL = '';

    if (pokemon.id != null) {
      imageURL =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${pokemon.id}.png';
    }

    final image = Image.network(
      imageURL,
      width: 120,
      height: 120,
      fit: BoxFit.cover,
    );

    return FutureBuilder<Color>(
        future: _getImagePalette(image.image),
        builder: (_, snapshot) {
          final bgColor = (snapshot.data ?? Colors.black26).withAlpha(150);

          return ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: GestureDetector(
              onTap: () {
                context.router.pushNamed('/details/${pokemon.name}');
              },
              child: Card(
                margin: const EdgeInsets.all(6),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  fit: StackFit.loose,
                  children: [
                    Positioned(
                      bottom: -20,
                      right: -20,
                      child: Transform.rotate(
                        angle: -0.1,
                        child: image,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      width: 6,
                      child: Container(
                        color: bgColor,
                      ),
                    ),
                    /*BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 0.0,
                        sigmaY: 0.0,
                        tileMode: TileMode.mirror,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 6),
                        width: double.infinity - 5,
                        height: 120,
                        color: bgColor.withOpacity(0.1),
                      ),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.name != null
                                ? pokemon.name!.toUpperCase()
                                : '',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            pokemon.id != null ? 'ID: ${pokemon.id}' : '',
                          ),
                          Text(
                            pokemon.weight != null
                                ? 'Weight: ${pokemon.weight}'
                                : '',
                          ),
                          Text(
                            pokemon.height != null
                                ? 'Height: ${pokemon.height}'
                                : '',
                          ),
                          Text(
                            pokemon.baseExperience != null
                                ? 'Experience: ${pokemon.baseExperience}'
                                : '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  // Calculate dominant color from ImageProvider
  Future<Color> _getImagePalette(ImageProvider? imageProvider) async {
    final paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider!);

    return paletteGenerator.dominantColor?.color ?? Colors.black26;
  }
}
