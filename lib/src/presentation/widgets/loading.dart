import 'package:flutter/material.dart';
import 'package:flutter_pokemon_clean_architecture/l10n/app_localizations.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/loading.gif',
            width: 190,
            height: 190,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 32),
          Text(
            AppLocalizations.of(context)!.pokemonLoading,
            style: theme.textTheme.titleMedium,
          ),
          /*const SizedBox(height: 16),
          SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              color: theme.primaryColor,
              strokeWidth: 2,
            ),
          ),*/
        ],
      ),
    );
  }
}
