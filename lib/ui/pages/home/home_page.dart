import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_pokemon_clean_architecture/ui/blocs/blocs.dart';
import 'package:flutter_pokemon_clean_architecture/ui/pages/home/widgets/pokemon_card.dart';
import 'package:flutter_pokemon_clean_architecture/ui/widgets/connection_status.dart';
import 'package:flutter_pokemon_clean_architecture/ui/widgets/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _limit = 20;

  final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    context.read<PokemonBloc>().add(const OnGetAll(_limit, 0));
    _pagingController.addPageRequestListener((pageKey) {
      context.read<PokemonBloc>().add(OnGetAll(_limit, pageKey));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: BlocListener<PokemonBloc, PokemonState>(
        listener: (context, state) {
          if (state is PokemonHasList) {
            if (state.result.length < _limit) {
              _pagingController.appendLastPage(state.result);
            } else {
              final nextPageKey = state.offset + state.result.length;
              _pagingController.appendPage(state.result, nextPageKey);
            }
          } else if (state is PokemonError) {
            _pagingController.error = state.message;
          }
        },
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoading) {
              return const Loading();
            } else if (state is PokemonHasList) {
              return Column(
                children: [
                  const ConnectionStatus(),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      context.read<PokemonBloc>().add(OnNameChanged(value));
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: PagedListView<int, Pokemon>(
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (_, item, __) =>
                            PokemonCard(pokemon: item),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is PokemonError) {
              return Text('Error: ${state.message}');
            } else {
              return const Text('No data');
            }
          },
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
