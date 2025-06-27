import 'package:flutter/material.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/pokemon.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.pokemon});
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sprites = pokemon.sprites
        .where((s) => s.value?.endsWith('.png') ?? false)
        .toList();

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _InfoRow(label: 'Height', value: pokemon.height?.toString()),
        _InfoRow(label: 'Weight', value: pokemon.weight?.toString()),
        _InfoRow(
          label: 'Experience',
          value: pokemon.baseExperience?.toString(),
        ),
        const SizedBox(height: 16),
        if (sprites.isNotEmpty)
          Column(
            children: [
              Text(
                'IMAGES',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sprites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final sprite = sprites[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Image.network(
                        sprite.value!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                        errorBuilder: (_, _, _) =>
                            const Icon(Icons.broken_image, size: 60),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(value!, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
