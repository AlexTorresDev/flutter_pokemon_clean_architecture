import 'package:flutter_pokemon_clean_architecture/src/domain/models/sprite.dart';

List<SpriteModel> flattenSprites(
  Map<String, dynamic> sprites, {
  String type = 'base',
}) {
  final List<SpriteModel> result = [];
  sprites.forEach((key, value) {
    if (value != null) {
      if (value is Map<String, dynamic>) {
        if (key == 'other' || key == 'versions') {
          value.forEach((subType, subValue) {
            if (subValue is Map<String, dynamic>) {
              result.addAll(flattenSprites(subValue, type: subType));
            }
          });
        } else {
          result.addAll(flattenSprites(value, type: key));
        }
      } else {
        result.add(SpriteModel(type: type, key: key, value: value?.toString()));
      }
    }
  });
  return result;
}
