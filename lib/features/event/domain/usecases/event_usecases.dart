import 'package:events/core/usecases/usecase.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/domain/repositories/event_repository.dart';

class EventFetchUsecase extends UseCase<List<EventEntity>, void>{

  EventRepository eventRepository;

  EventFetchUsecase({required this.eventRepository});

  @override
  Future<List<EventEntity>> call({param})async {
     return await eventRepository.fetchEvents();
  }

}