import 'package:events/core/usecases/usecase.dart';
import 'package:events/features/event/domain/entities/eventEntity.dart';
import 'package:events/features/event/domain/repositories/event_repository.dart';

class EventSearchUsecase extends UseCase<List<EventEntity>, String?>{

  EventRepository eventRepository;

  EventSearchUsecase({required this.eventRepository});

  @override
  Future<List<EventEntity>> call({String? param})async {
    return await eventRepository.searchEvents(param!);
  }
  
}