import 'package:flutter/material.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/providers/pokemon/pokemon_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'widgets/pokemon_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const _limit = 20;

  late final _pagingController = PagingController<int, PokemonModel>(
    getNextPageKey: (state) =>
        (state.keys?.isEmpty ?? true) ? 0 : (state.keys!.last + _limit),
    fetchPage: (pageKey) async => ref.read(
      pokemonProvider(
        PokemonQueryParams(limit: _limit, offset: pageKey),
      ).future,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon')),
      body: PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) =>
            PagedListView<int, PokemonModel>(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) =>
                    PokemonCard(pokemon: item),
              ),
            ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
