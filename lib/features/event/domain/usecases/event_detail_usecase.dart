import 'package:events/core/usecases/usecase.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/domain/repositories/event_repository.dart';

class EventDetailUseCase extends UseCase<EventEntity, int>{

  EventRepository eventRepository;

  EventDetailUseCase({required this.eventRepository});

  @override
  Future<EventEntity> call({int? param})async {
    return await eventRepository.fetchEventsDetails(param!);
  }

}