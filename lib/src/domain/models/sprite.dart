import 'package:equatable/equatable.dart';

class SpriteModel extends Equatable {
  const SpriteModel({
    required this.type,
    required this.key,
    required this.value,
  });

  factory SpriteModel.fromJson(Map<String, dynamic> json) => SpriteModel(
    type: json['type'] ?? '',
    key: json['key'] ?? '',
    value: json['value'],
  );

  final String type;
  final String key;
  final String? value;

  Map<String, dynamic> toJson() => {'type': type, 'key': key, 'value': value};

  @override
  List<Object?> get props => [type, key, value];
}
