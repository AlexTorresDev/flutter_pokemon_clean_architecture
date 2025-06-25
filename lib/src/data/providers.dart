import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/providers.dart';
import 'datasources/remote_data_source.dart';
import 'datasources/local_data_source.dart';

final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  final client = ref.watch(clientProvider);
  return RemoteDataSourceImpl(client: client);
});

final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  final db = ref.watch(dbProvider);
  return LocalDataSourceImpl(dbProvider: db);
});
