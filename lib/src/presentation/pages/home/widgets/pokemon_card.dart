import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pokemon_clean_architecture/src/config/utils/images.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/home/widgets/pokemon_card_skeleton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    String imageURL = '';
    if (pokemon.id != null) {
      imageURL =
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${pokemon.id}.svg';
    }

    return FutureBuilder<_CardData>(
      future: _getCardData(imageURL),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const PokemonCardSkeleton();
        }

        final file = snapshot.data!.file;
        final bgColor = snapshot.data!.bgColor;

        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: GestureDetector(
            onTap: () {
              context.go('/details/${pokemon.name}');
            },
            child: Card(
              margin: const EdgeInsets.all(6),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                fit: StackFit.loose,
                children: [
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: Transform.rotate(
                      angle: -0.1,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: bgColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.file(
                            file,
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: 6,
                    child: Container(color: bgColor),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 0.0,
                      sigmaY: 0.0,
                      tileMode: TileMode.mirror,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 6),
                      width: double.infinity - 5,
                      height: 160,
                      color: bgColor.withValues(alpha: 0.1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name?.toUpperCase() ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(pokemon.id != null ? 'ID: ${pokemon.id}' : ''),
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
      },
    );
  }

  Future<_CardData> _getCardData(String url) async {
    final fileInfo = await _getCachedSvgFile(url);
    final palette = await _getSvgPalette(fileInfo.file);
    final bgColor = (palette.isNotEmpty) ? palette[0] : Colors.transparent;
    return _CardData(file: fileInfo.file, bgColor: bgColor);
  }

  Future<FileInfo> _getCachedSvgFile(String url) async {
    final cacheManager = DefaultCacheManager();
    FileInfo? fileInfo = await cacheManager.getFileFromCache(url);
    if (fileInfo != null) return fileInfo;
    return await cacheManager.downloadFile(url);
  }

  Future<List<Color>> _getSvgPalette(File file) =>
      getColorSchemeFromImage(file);
}

class _CardData {
  _CardData({required this.file, required this.bgColor});
  final File file;
  final Color bgColor;
}
