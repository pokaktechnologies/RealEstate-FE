
import 'package:equatable/equatable.dart';

abstract class DealEvent extends Equatable {
  const DealEvent();

  @override
  List<Object?> get props => [];
}

class FetchDeals extends DealEvent {}
