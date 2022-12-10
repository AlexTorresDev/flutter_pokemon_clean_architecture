import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
