import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/ui/bloc/pokemon_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/ui/bloc/pokemon_event.dart';
import 'package:flutter_pokemon_clean_architecture/ui/bloc/pokemon_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pokemon',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter pokemon name',
              ),
              onChanged: (query) {
                context.read<PokemonBloc>().add(OnNameChanged(query));
              },
            ),
            const SizedBox(height: 32.0),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonHasData) {
                  Pokemon pokemon = state.result;

                  return Column(
                    key: const Key('pokemon_data'),
                    children: [
                      Text(
                        'Pokemon ${pokemon.name}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Table(
                        defaultColumnWidth: const FixedColumnWidth(150.0),
                        border: TableBorder.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        children: [
                          TableRow(
                            children: [
                              const TableCell(
                                text: 'Weight',
                                isBold: true,
                              ),
                              TableCell(
                                text: pokemon.weight.toString(),
                                isBold: false,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                text: 'Height',
                                isBold: true,
                              ),
                              TableCell(
                                text: pokemon.height.toString(),
                                isBold: false,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                text: 'ID',
                                isBold: true,
                              ),
                              TableCell(
                                text: pokemon.id.toString(),
                                isBold: false,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const TableCell(
                                text: 'Base Experience',
                                isBold: true,
                              ),
                              TableCell(
                                text: pokemon.baseExperience.toString(),
                                isBold: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (state is PokemonError) {
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TableCell extends StatelessWidget {
  const TableCell({
    Key? key,
    required this.text,
    required this.isBold,
  }) : super(key: key);

  final String text;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          letterSpacing: 1.2,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
