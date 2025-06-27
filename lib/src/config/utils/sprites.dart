import 'package:flutter_pokemon_clean_architecture/src/domain/models/sprite.dart';

List<SpriteModel> flattenSprites(
  Map<String, dynamic> sprites, {
  String type = 'base',
}) {
  final List<SpriteModel> result = [];
  if (sprites.containsKey('other')) {
    final other = sprites['other'] as Map<String, dynamic>;
    for (final key in ['home', 'official-artwork']) {
      if (other.containsKey(key)) {
        final subSprites = other[key] as Map<String, dynamic>;
        subSprites.forEach((spriteKey, value) {
          if (value != null && value is String && value.isNotEmpty) {
            result.add(SpriteModel(type: key, key: spriteKey, value: value));
          }
        });
      }
    }
  }
  return result;
}
