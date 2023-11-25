// ignore_for_file: must_be_immutable

part of 'event_detail_bloc.dart';

sealed class EventDetailEvent extends Equatable {
  int? eventId;
  EventDetailEvent({this.eventId});

  @override
  List<Object?> get props => [eventId];
}

class EventDetailFetchEvent extends EventDetailEvent{
  EventDetailFetchEvent(int id) : super(eventId: id);
}