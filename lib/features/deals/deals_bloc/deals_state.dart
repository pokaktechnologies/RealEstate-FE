
import 'package:equatable/equatable.dart';
import 'package:realestate_fe/models/dealsmodel.dart';

abstract class DealState extends Equatable {
  const DealState();

  @override
  List<Object?> get props => [];
}

class DealInitial extends DealState {}

class DealLoading extends DealState {}

class DealLoaded extends DealState {
  final List<DealModel> deals;

  const DealLoaded(this.deals);

  @override
  List<Object?> get props => [deals];
}

class DealError extends DealState {
  final String message;

  const DealError(this.message);

  @override
  List<Object?> get props => [message];
}
