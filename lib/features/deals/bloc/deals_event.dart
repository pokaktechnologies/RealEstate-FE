// part of 'deals_bloc.dart';

// sealed class DealsEvent extends Equatable {
//   const DealsEvent();

//   @override
//   List<Object> get props => [];
// }
import 'package:equatable/equatable.dart';

abstract class DealEvent extends Equatable {
  const DealEvent();

  @override
  List<Object?> get props => [];
}

class FetchDeals extends DealEvent {}
