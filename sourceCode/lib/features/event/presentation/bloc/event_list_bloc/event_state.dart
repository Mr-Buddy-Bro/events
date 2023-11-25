// ignore_for_file: must_be_immutable

part of 'event_bloc.dart';

abstract class EventState extends Equatable {
  List<EventEntity>? events;
  EventState({this.events});  

  @override
  List<Object?> get props => [events];
}
class EventInitial extends EventState {}

class EventLoadingState extends EventState{}

class EventFetchedState extends EventState{
  EventFetchedState(List<EventEntity> events): super(events: events);
}

class EventFetchingFailedState extends EventState{}