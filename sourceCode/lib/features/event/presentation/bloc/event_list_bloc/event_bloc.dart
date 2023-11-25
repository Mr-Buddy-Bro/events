import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/domain/usecases/event_usecases.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventFetchUsecase eventFetchUsecase;

  EventBloc({required this.eventFetchUsecase}) : super(EventInitial()) {
    on<EventEvent>((event, emit)async {
      if(event is EventFetchEvent){
        emit(EventLoadingState());
        List<EventEntity> events = await eventFetchUsecase.call();
        if(events.isEmpty){
          emit(EventFetchingFailedState());
        }else {
          emit(EventFetchedState(events));
        }
      }
    });
  }
}
