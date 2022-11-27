import 'package:equatable/equatable.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object?> get props => [];
}

class OnGetDetails extends DetailsEvent {
  const OnGetDetails(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
