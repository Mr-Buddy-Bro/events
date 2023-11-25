import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/domain/usecases/event_search_usecase..dart';

part 'event_search_event.dart';
part 'event_search_state.dart';

class EventSearchBloc extends Bloc<EventSearchEvent, EventSearchState> {
  EventSearchUsecase eventSearchUsecase;

  EventSearchBloc({required this.eventSearchUsecase}) : super(EventSearchInitial()) {
    on<EventSearchEvent>((event, emit)async {
      if(event is EventFetchSearchEvent){
        emit(EventSearchLoadingState());
        List<EventEntity> events = await eventSearchUsecase.call(param: event.searchText);
        if(events.isEmpty){
          emit(EventSearchFetchingFailedState());
        }else {
          emit(EventSearchFetchedState(events));
        }
      }
    });
  }
}
