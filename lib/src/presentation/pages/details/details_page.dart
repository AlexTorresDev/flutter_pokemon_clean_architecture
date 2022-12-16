import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/blocs/blocs.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    context.read<DetailsBloc>().add(OnGetDetails(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailsHasData) {
            final pokemon = state.pokemon;
            return Text(pokemon.name!);
          } else if (state is DetailsError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
