import 'package:flutter_pokemon_clean_architecture/src/core/connections/db_provider.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/network/client_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientProvider = Provider<ClientService>((ref) {
  return ClientService();
});

final dbProvider = Provider<DBProvider>((ref) {
  return DBProvider.instance;
});
