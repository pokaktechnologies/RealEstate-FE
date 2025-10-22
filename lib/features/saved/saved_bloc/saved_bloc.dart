// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:realestate_fe/features/saved/saved_bloc/saved_event.dart';
// import 'package:realestate_fe/features/saved/saved_bloc/saved_state.dart';
// import 'package:realestate_fe/services/saved/saved_repository.dart';

// class SavedBloc extends Bloc<SavedEvent, SavedState> {
//   final SavedRepository repository;

//   SavedBloc(this.repository) : super(SavedInitial()) {
//     on<FetchSavedProperties>((event, emit) async {
//       emit(SavedLoading());
//       try {
//         final properties = await repository.getSavedProperties();
//         if (properties.isEmpty) {
//           emit(SavedEmpty());
//         } else {
//           emit(SavedLoaded(properties));
//         }
//       } catch (e) {
//         emit(SavedError('Failed to load saved properties'));
//       }
//     });

//     on<AddSavedProperty>((event, emit) async {
//       await repository.addSavedProperty(event.propertyId);
//       add(FetchSavedProperties());
//     });

//     on<RemoveSavedProperty>((event, emit) async {
//       if (state is SavedLoaded) {
//         final current = (state as SavedLoaded).properties;
//         final updatedList =
//             current.where((p) => p.id != event.savedId).toList();

//         // Optimistic update
//         emit(updatedList.isEmpty ? SavedEmpty() : SavedLoaded(updatedList));

//         try {
//           await repository.removeSavedProperty(event.savedId);
//         } catch (e) {
//           // Rollback on failure
//           emit(SavedLoaded(current));
//           print('Failed to remove saved property: $e');
//           // optionally show SnackBar here
//         }
//       }
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate_fe/features/saved/saved_bloc/saved_event.dart';
import 'package:realestate_fe/features/saved/saved_bloc/saved_state.dart';
import 'package:realestate_fe/services/saved/saved_repository.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedRepository repository;

  SavedBloc(this.repository) : super(SavedInitial()) {
    on<FetchSavedProperties>((event, emit) async {
      emit(SavedLoading());
      try {
        final properties = await repository.getSavedProperties();
        if (properties.isEmpty) {
          emit(SavedEmpty());
        } else {
          emit(SavedLoaded(properties));
        }
      } catch (e) {
        emit(SavedError('Failed to load saved properties'));
      }
    });

    on<AddSavedProperty>((event, emit) async {
      await repository.addSavedProperty(event.propertyId);
      add(FetchSavedProperties());
    });

    on<RemoveSavedProperty>((event, emit) async {
      if (state is SavedLoaded) {
        final current = (state as SavedLoaded).properties;
        final updatedList =
            current.where((p) => p.savedId != event.savedId).toList();
        emit(updatedList.isEmpty ? SavedEmpty() : SavedLoaded(updatedList));
        try {
          await repository.removeSavedProperty(event.savedId);
          emit(SavedDeleted());
          emit(updatedList.isEmpty ? SavedEmpty() : SavedLoaded(updatedList));
        } catch (e) {
          emit(SavedLoaded(current));
          print('Failed to remove saved property: $e');
        }
      }
    });
  }
}
