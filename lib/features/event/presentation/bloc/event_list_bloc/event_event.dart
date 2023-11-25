// ignore_for_file: must_be_immutable

part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  EventEvent();

  @override
  List<Object?> get props => [];
}


class EventFetchEvent extends EventEvent{}