import 'package:events/features/event/data/datasources/remote_datasource.dart';
import 'package:events/features/event/data/models/event_model.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/domain/repositories/event_repository.dart';

class EventRepositoryImplementation extends EventRepository{

  RemoteDataSource remoteDataSource;

  EventRepositoryImplementation({required this.remoteDataSource});

  @override
  Future<List<EventEntity>> fetchEvents() async{
    List<EventModel> eventModels = await remoteDataSource.fetchEvents();
    List<EventEntity> events = [];
    for (var event in eventModels) { 
      events.add(event.toEntity());
    }

    return events;
  }
  
  @override
  Future<List<EventEntity>> searchEvents(String text)async {
    List<EventModel> eventModels = await remoteDataSource.searchEvent(text);
    List<EventEntity> events = [];
    for (var event in eventModels) { 
      events.add(event.toEntity());
    }

    return events;
  }
  
  @override
  Future<EventEntity> fetchEventsDetails(int id)async {
    EventModel eventModel = await remoteDataSource.fetchEventDetails(id);
    return eventModel.toEntity();
  }

}