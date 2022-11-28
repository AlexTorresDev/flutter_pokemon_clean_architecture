import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/ui/blocs/blocs.dart';
import 'package:flutter_pokemon_clean_architecture/ui/pages/home/widgets/pokemon_card.dart';
import 'package:flutter_pokemon_clean_architecture/ui/widgets/connection_status.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PokemonBloc>().add(const OnGetAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ConnectionStatus(),
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
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonHasList) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.result.length,
                    itemBuilder: (context, index) {
                      final pokemon = state.result[index];
                      return PokemonCard(pokemon: pokemon);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                  );
                } else if (state is PokemonError) {
                  return Text('Error: ${state.message}');
                } else {
                  return const Text('No data');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
