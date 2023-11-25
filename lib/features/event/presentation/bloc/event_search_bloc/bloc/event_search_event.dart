// ignore_for_file: must_be_immutable

part of 'event_search_bloc.dart';

sealed class EventSearchEvent extends Equatable {
  String? searchText;
  EventSearchEvent({this.searchText});

  @override
  List<Object?> get props => [searchText];
}

class EventFetchSearchEvent extends EventSearchEvent{
  EventFetchSearchEvent(String text):super(searchText: text);
}