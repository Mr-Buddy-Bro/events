import 'package:events/features/event/domain/entities/eventEntity.dart';

abstract class EventRepository{
  Future<List<EventEntity>> fetchEvents();
}