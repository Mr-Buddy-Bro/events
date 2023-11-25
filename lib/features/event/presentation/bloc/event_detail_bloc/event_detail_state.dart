// ignore_for_file: must_be_immutable

part of 'event_detail_bloc.dart';

sealed class EventDetailState extends Equatable {
  EventEntity? eventEntity;
  EventDetailState({this.eventEntity});
  
  @override
  List<Object?> get props => [eventEntity];
}

final class EventDetailInitial extends EventDetailState {}

class EventDetailLoadingSate extends EventDetailState{}

class EventDetailFetchedSate extends EventDetailState{
  EventDetailFetchedSate(EventEntity event) : super(eventEntity: event);
}