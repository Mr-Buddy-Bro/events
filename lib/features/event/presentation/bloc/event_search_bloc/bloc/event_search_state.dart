// ignore_for_file: must_be_immutable

part of 'event_search_bloc.dart';

sealed class EventSearchState extends Equatable {
  List<EventEntity>? searchedEvents;
  EventSearchState({this.searchedEvents});
  
  @override
  List<Object> get props => [];
}

final class EventSearchInitial extends EventSearchState {}

class EventSearchFetchedState extends EventSearchState{
  EventSearchFetchedState(List<EventEntity> events): super(searchedEvents: events);
}

class EventSearchLoadingState extends EventSearchState{}

class EventSearchFetchingFailedState extends EventSearchState{}