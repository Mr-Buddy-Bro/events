import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/domain/usecases/event_detail_usecase.dart';

part 'event_detail_event.dart';
part 'event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {

  EventDetailUseCase eventDetailUseCase;

  EventDetailBloc({required this.eventDetailUseCase}) : super(EventDetailInitial()) {
    on<EventDetailEvent>((event, emit)async {
      if(event is EventDetailFetchEvent){
        emit(EventDetailLoadingSate());
        EventEntity eventEntity = await eventDetailUseCase.call(param: event.eventId);
        emit(EventDetailFetchedSate(eventEntity));
      }
    });
  }
}
