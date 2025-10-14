import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/deals/deals_bloc/deals_event.dart';
import 'package:realestate_fe/features/deals/deals_bloc/deals_state.dart';

import 'package:realestate_fe/services/deal/deals_repository.dart';

class DealBloc extends Bloc<DealEvent, DealState> {
  final DealRepository dealRepository;

  DealBloc(this.dealRepository) : super(DealInitial()) {
    on<FetchDeals>(_onFetchDeals);
  }

  Future<void> _onFetchDeals(FetchDeals event, Emitter<DealState> emit) async {
    emit(DealLoading());
    try {
      final deals = await dealRepository.getDeals();
      emit(DealLoaded(deals));
    } catch (e) {
      emit(DealError(e.toString()));
    }
  }
}
