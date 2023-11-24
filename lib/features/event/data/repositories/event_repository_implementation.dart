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
    for (var element in eventModels) { 
      events.add(element.toEntity());
    }

    return events;
  }

}